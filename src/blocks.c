#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#include "cmark_ctype.h"
#include "config.h"
#include "parser.h"
#include "cmark.h"
#include "node.h"
#include "references.h"
#include "utf8.h"
#include "scanners.h"
#include "inlines.h"
#include "houdini.h"
#include "buffer.h"
#include "debug.h"

#define CODE_INDENT 4
#define peek_at(i, n) (i)->data[n]

#define DEBUG

#ifdef DEBUG
#define dbg_printf(...) printf(__VA_ARGS__)
#else
#define dbg_printf(...)
#endif

static void
S_parser_feed(cmark_parser *parser, const unsigned char *buffer, size_t len,
              bool eof);

void print_nodes(cmark_node *root);

static void
S_process_line(cmark_parser *parser, const unsigned char *buffer,
               size_t bytes);

static cmark_node* make_block(cmark_node_type tag, int start_line, int start_column)
{
    cmark_node* e;
    
    e = (cmark_node *)calloc(1, sizeof(*e));
    if(e != NULL) {
        e->type = tag;
        e->open = true;
        e->start_line = start_line;
        e->start_column = start_column;
        e->end_line = start_line;
        cmark_strbuf_init(&e->string_content, 32);
    }
    
    return e;
}

// Create a root document node.
static cmark_node* make_document()
{
    cmark_node *e = make_block(NODE_DOCUMENT, 1, 1);
    return e;
}

cmark_parser *cmark_parser_new(int options)
{
    cmark_parser *parser = (cmark_parser*)malloc(sizeof(cmark_parser));
    cmark_node *document = make_document();
    cmark_strbuf *line = (cmark_strbuf*)malloc(sizeof(cmark_strbuf));
    cmark_strbuf *buf  = (cmark_strbuf*)malloc(sizeof(cmark_strbuf));
    cmark_strbuf_init(line, 256);
    cmark_strbuf_init(buf, 0);
    
    parser->refmap = cmark_reference_map_new();
    parser->root = document;
    parser->current = document;
    parser->line_number = 0;
    parser->curline = line;
    parser->last_line_length = 0;
    parser->linebuf = buf;
    parser->options = options;
    
    return parser;
}

void cmark_parser_free(cmark_parser *parser)
{
    cmark_strbuf_free(parser->curline);
    free(parser->curline);
    cmark_strbuf_free(parser->linebuf);
    free(parser->linebuf);
    cmark_reference_map_free(parser->refmap);
    free(parser);
}

static cmark_node*
finalize(cmark_parser *parser, cmark_node* b);

// Returns true if line has only space characters, else false.
static bool is_blank(cmark_strbuf *s, int offset)
{
    while (offset < s->size) {
        switch (s->ptr[offset]) {
            case '\n':
                return true;
            case ' ':
                offset++;
                break;
            default:
                return false;
        }
    }
    
    return true;
}

static inline bool can_contain(cmark_node_type parent_type, cmark_node_type child_type)
{
    return ( parent_type == NODE_DOCUMENT ||
            parent_type == NODE_BLOCK_QUOTE ||
            parent_type == NODE_ITEM ||
            (parent_type == NODE_LIST && child_type == NODE_ITEM) );
}

static inline bool accepts_lines(cmark_node_type block_type)
{
    return (block_type == NODE_PARAGRAPH ||
            block_type == NODE_HEADER ||
            block_type == NODE_CODE_BLOCK);
}

static void add_line(cmark_node* node, cmark_chunk *ch, int offset)
{
    assert(node->open);
    cmark_strbuf_put(&node->string_content, ch->data + offset, ch->len - offset);
}

static void remove_trailing_blank_lines(cmark_strbuf *ln)
{
    int i;
    
    for (i = ln->size - 1; i >= 0; --i) {
        unsigned char c = ln->ptr[i];
        
        if (c != ' ' && c != '\t' && c != '\r' && c != '\n')
            break;
    }
    
    if (i < 0) {
        cmark_strbuf_clear(ln);
        return;
    }
    
    i = cmark_strbuf_strchr(ln, '\n', i);
    if (i >= 0)
        cmark_strbuf_truncate(ln, i);
}

// Check to see if a node ends with a blank line, descending
// if needed into lists and sublists.
static bool ends_with_blank_line(cmark_node* node)
{
    cmark_node *cur = node;
    while (cur != NULL) {
        if (cur->last_line_blank) {
            return true;
        }
        if (cur->type == NODE_LIST || cur->type == NODE_ITEM) {
            cur = cur->last_child;
        } else {
            cur = NULL;
        }
    }
    return false;
}

// Break out of all containing lists
static int break_out_of_lists(cmark_parser *parser, cmark_node ** bptr)
{
    cmark_node *container = *bptr;
    cmark_node *b = parser->root;
    // find first containing NODE_LIST:
    while (b && b->type != NODE_LIST) {
        b = b->last_child;
    }
    if (b) {
        while (container && container != b) {
            container = finalize(parser, container);
        }
        finalize(parser, b);
        *bptr = b->parent;
    }
    return 0;
}


static cmark_node*
finalize(cmark_parser *parser, cmark_node* b)
{
    int firstlinelen;
    int pos;
    cmark_node* item;
    cmark_node* subitem;
    cmark_node* parent;
    
    parent = b->parent;
    
    assert(b->open);  // shouldn't call finalize on closed blocks
    b->open = false;
    
    if (parser->curline->size == 0) {
        // end of input - line number has not been incremented
        b->end_line = parser->line_number;
        b->end_column = parser->last_line_length;
    } else if (b->type == NODE_DOCUMENT ||
               (b->type == NODE_CODE_BLOCK && b->as.code.fenced) ||
               (b->type == NODE_HEADER && b->as.header.setext)) {
        b->end_line = parser->line_number;
        b->end_column = parser->curline->size -
        (parser->curline->ptr[parser->curline->size - 1] == '\n' ?
         1 : 0);
    } else {
        b->end_line = parser->line_number - 1;
        b->end_column = parser->last_line_length;
    }
    
    switch (b->type) {
        case NODE_PARAGRAPH:
            if(cmark_strbuf_at(&b->string_content,0)=='[')
            {
                while (cmark_strbuf_at(&b->string_content, 0) == '[' &&
                       (pos = cmark_parse_reference_inline(&b->string_content, parser->refmap))) {
                    cmark_strbuf_drop(&b->string_content, pos);
                }
                if (is_blank(&b->string_content, 0)) {
                    // remove blank node (former reference def)
                    cmark_node_free(b);
                }
            }
            else if(cmark_strbuf_at(&b->string_content,0)=='<' && cmark_strbuf_at(&b->string_content,1)=='<')
            {
                while(cmark_strbuf_at(&b->string_content,0)=='<' && cmark_strbuf_at(&b->string_content,1)=='<' && (pos = cmark_parse_include_inline(&b->string_content,parser)))
                {
//                    printf("I CAME HERE \n");
                    cmark_strbuf_drop(&b->string_content,pos);
                }
                if(is_blank(&b->string_content,0))
                {
                    cmark_node_free(b);
                }
            }
            break;
            
        case NODE_CODE_BLOCK:
            if (!b->as.code.fenced) { // indented code
                remove_trailing_blank_lines(&b->string_content);
                cmark_strbuf_putc(&b->string_content, '\n');
            } else {
                
                // first line of contents becomes info
                firstlinelen = cmark_strbuf_strchr(&b->string_content, '\n', 0);
                
                cmark_strbuf tmp = GH_BUF_INIT;
                houdini_unescape_html_f(
                                        &tmp,
                                        b->string_content.ptr,
                                        firstlinelen
                                        );
                cmark_strbuf_trim(&tmp);
                cmark_strbuf_unescape(&tmp);
                b->as.code.info = cmark_chunk_buf_detach(&tmp);
                
                cmark_strbuf_drop(&b->string_content, firstlinelen + 1);
            }
            b->as.code.literal = cmark_chunk_buf_detach(&b->string_content);
            break;
            
        case NODE_HTML:
            b->as.literal = cmark_chunk_buf_detach(&b->string_content);
            break;
            
        case NODE_LIST: // determine tight/loose status
            b->as.list.tight = true; // tight by default
            item = b->first_child;
            
            while (item) {
                // check for non-final non-empty list item ending with blank line:
                if (item->last_line_blank && item->next) {
                    b->as.list.tight = false;
                    break;
                }
                // recurse into children of list item, to see if there are
                // spaces between them:
                subitem = item->first_child;
                while (subitem) {
                    if (ends_with_blank_line(subitem) &&
                        (item->next || subitem->next)) {
                        b->as.list.tight = false;
                        break;
                    }
                    subitem = subitem->next;
                }
                if (!(b->as.list.tight)) {
                    break;
                }
                item = item->next;
            }
            
            break;
            
        default:
            break;
    }
    return parent;
}

// Add a node as child of another.  Return pointer to child.
static cmark_node* add_child(cmark_parser *parser, cmark_node* parent,
                             cmark_node_type block_type, int start_column)
{
    assert(parent);
    
    // if 'parent' isn't the kind of node that can accept this child,
    // then back up til we hit a node that can.
    while (!can_contain(parent->type, block_type)) {
        parent = finalize(parser, parent);
    }
    
    cmark_node* child = make_block(block_type, parser->line_number, start_column);
    child->parent = parent;
    
    if (parent->last_child) {
        parent->last_child->next = child;
        child->prev = parent->last_child;
    } else {
        parent->first_child = child;
        child->prev = NULL;
    }
    parent->last_child = child;
    return child;
}


// Walk through node and all children, recursively, parsing
// string content into inline content where appropriate.
static void process_inlines(cmark_node* root, cmark_reference_map *refmap, int options)
{
    cmark_iter *iter = cmark_iter_new(root);
    cmark_node *cur;
    cmark_event_type ev_type;
    
    while ((ev_type = cmark_iter_next(iter)) != CMARK_EVENT_DONE) {
        cur = cmark_iter_get_node(iter);
        if (ev_type == CMARK_EVENT_ENTER) {
            if (cur->type == NODE_PARAGRAPH ||
                cur->type == NODE_HEADER) {
                cmark_parse_inlines(cur, refmap, options);
            }
        }
    }
    
    cmark_iter_free(iter);
}

// Attempts to parse a list item marker (bullet or enumerated).
// On success, returns length of the marker, and populates
// data with the details.  On failure, returns 0.
static int parse_list_marker(cmark_chunk *input, int pos, cmark_list **dataptr)
{
    unsigned char c;
    int startpos;
    cmark_list *data;
    
    startpos = pos;
    c = peek_at(input, pos);
    
    if (c == '*' || c == '-' || c == '+') {
        pos++;
        if (!cmark_isspace(peek_at(input, pos))) {
            return 0;
        }
        data = (cmark_list *)calloc(1, sizeof(*data));
        if(data == NULL) {
            return 0;
        } else {
            data->marker_offset = 0; // will be adjusted later
            data->list_type = CMARK_BULLET_LIST;
            data->bullet_char = c;
            data->start = 1;
            data->delimiter = CMARK_PERIOD_DELIM;
            data->tight = false;
        }
    } else if (cmark_isdigit(c)) {
        int start = 0;
        
        do {
            start = (10 * start) + (peek_at(input, pos) - '0');
            pos++;
        } while (cmark_isdigit(peek_at(input, pos)));
        
        c = peek_at(input, pos);
        if (c == '.' || c == ')') {
            pos++;
            if (!cmark_isspace(peek_at(input, pos))) {
                return 0;
            }
            data = (cmark_list *)calloc(1, sizeof(*data));
            if(data == NULL) {
                return 0;
            } else {
                data->marker_offset = 0; // will be adjusted later
                data->list_type = CMARK_ORDERED_LIST;
                data->bullet_char = 0;
                data->start = start;
                data->delimiter = (c == '.' ? CMARK_PERIOD_DELIM : CMARK_PAREN_DELIM);
                data->tight = false;
            }
        } else {
            return 0;
        }
        
    } else {
        return 0;
    }
    *dataptr = data;
    return (pos - startpos);
}

// Return 1 if list item belongs in list, else 0.
static int lists_match(cmark_list *list_data, cmark_list *item_data)
{
    return (list_data->list_type == item_data->list_type &&
            list_data->delimiter == item_data->delimiter &&
            // list_data->marker_offset == item_data.marker_offset &&
            list_data->bullet_char == item_data->bullet_char);
}

//This function will encompass everything except the head node inside a document node and return a new node if a head node exists. Otherwise it will return the old node
cmark_node *add_body(cmark_node *root)
{
    if(root->type!=NODE_DOCUMENT)
    {
        fprintf(stderr,"Body can only be added to document node \n");
        exit(1);
    }
    assert(root->type==NODE_DOCUMENT);
    if(root->first_child->type==NODE_HEAD)
    {
        print_nodes(root);
        cmark_node *head = root->first_child;
        cmark_node_unlink(root->first_child);
        root->type = NODE_BODY;
        cmark_node *new_root = cmark_node_new(NODE_DOCUMENT);
        cmark_node_append_child(new_root,root);
        //reset the parameters of the old document
        new_root->start_line = root->start_line;
        new_root->start_column = root->start_column;
        new_root->end_line = root->end_line;
        new_root->end_column = root->end_column;
        new_root->open = root->open;
        new_root->last_line_blank = root->last_line_blank;
        cmark_node_prepend_child(new_root,head);
        return root->parent;
    }
    else
    {
        return root;
    }
    
}


static cmark_node *finalize_document(cmark_parser *parser)
{
    while (parser->current != parser->root) {
        parser->current = finalize(parser, parser->current);
    }
    finalize(parser, parser->root);
    process_inlines(parser->root, parser->refmap, parser->options);
    
    parser->root = add_body(parser->root);
    
    return parser->root;
}

cmark_node *cmark_parse_file(FILE *f, int options)
{
    unsigned char buffer[4096];
    cmark_parser *parser = cmark_parser_new(options);
    size_t bytes;
    cmark_node *document;
    
    while ((bytes = fread(buffer, 1, sizeof(buffer), f)) > 0) {
        bool eof = bytes < sizeof(buffer);
        S_parser_feed(parser, buffer, bytes, eof);
        if (eof) {
            break;
        }
    }
    
    document = cmark_parser_finish(parser);
    cmark_parser_free(parser);
    return document;
}

cmark_node *cmark_parse_document(const char *buffer, size_t len, int options)
{
    cmark_parser *parser = cmark_parser_new(options);
    cmark_node *document;
    
    S_parser_feed(parser, (const unsigned char *)buffer, len, true);
    
    document = cmark_parser_finish(parser);
    cmark_parser_free(parser);
    return document;
}

void
cmark_parser_feed(cmark_parser *parser, const char *buffer, size_t len)
{
    S_parser_feed(parser, (const unsigned char *)buffer, len, false);
}

static void
S_parser_feed(cmark_parser *parser, const unsigned char *buffer, size_t len,
              bool eof)
{
    const unsigned char *end = buffer + len;
    
    while (buffer < end) {
        const unsigned char *eol
        = (const unsigned char *)memchr(buffer, '\n',
                                        end - buffer);
        size_t line_len;
        
        if (eol) {
            line_len = eol + 1 - buffer;
        } else if (eof) {
            line_len = end - buffer;
        } else {
            cmark_strbuf_put(parser->linebuf, buffer, end - buffer);
            break;
        }
        
        //parser->linebuf will be empty unless you have a string of 4096 characters without a new line or an end of file. Enter this if statement if you need encountered new line character in second parse
        if (parser->linebuf->size > 0) {
            cmark_strbuf_put(parser->linebuf, buffer, line_len);
            S_process_line(parser, parser->linebuf->ptr,
                           parser->linebuf->size);
            cmark_strbuf_clear(parser->linebuf);
        } else {
            S_process_line(parser, buffer, line_len);
        }
        
        buffer += line_len;
    }
}

static void chop_trailing_hashtags(cmark_chunk *ch)
{
    int n, orig_n;
    
    cmark_chunk_rtrim(ch);
    orig_n = n = ch->len - 1;
    
    // if string ends in space followed by #s, remove these:
    while (n >= 0 && peek_at(ch, n) == '#')
        n--;
    
    // Check for a be a space before the final #s:
    if (n != orig_n && n >= 0 && peek_at(ch, n) == ' ') {
        ch->len = n;
        cmark_chunk_rtrim(ch);
    }
}

static void
S_process_line(cmark_parser *parser, const unsigned char *buffer, size_t bytes)
{
    cmark_node* last_matched_container;
    int offset = 0;
    int matched = 0;
    int lev = 0;
    int i;
    cmark_list *data = NULL;
    bool all_matched = true;
    cmark_node* container;
    bool blank = false;
    int first_nonspace;
    int indent;
    cmark_chunk input;
    bool maybe_lazy;
    
    //utf8proc_detab will replace tabs with 4 spaces and add the string in buffer to parser->curline
    utf8proc_detab(parser->curline, buffer, bytes);
    // Add a newline to the end if not present:
    // TODO this breaks abstraction:
    if (parser->curline->ptr[parser->curline->size - 1] != '\n') {
        cmark_strbuf_putc(parser->curline, '\n');
    }
    input.data = parser->curline->ptr;
    input.len = parser->curline->size;
    
    // container starts at the document root.
    container = parser->root;
    
    parser->line_number++;
    
    // for each containing node, try to parse the associated line start.
    // bail out on failure:  container will point to the last matching node.
    
    //enter this while loop if you are trying to match the current line to something that was left abruptly at the end of the last line but can continue with the new line like a blockquote or a list marker. Keep backing up till you find a match. Worst case you will go upto document
    
    while (container->last_child && container->last_child->open) {
        container = container->last_child;
        
        first_nonspace = offset;
        while (peek_at(&input, first_nonspace) == ' ') {
            first_nonspace++;
        }
        
        indent = first_nonspace - offset;
        blank = peek_at(&input, first_nonspace) == '\n';
        
        //blockquote matches if the indent of next line >=3
        if (container->type == NODE_BLOCK_QUOTE) {
            matched = indent <= 3 && peek_at(&input, first_nonspace) == '>';
            if (matched) {
                offset = first_nonspace + 1;
                if (peek_at(&input, offset) == ' ')
                    offset++;
            } else {
                all_matched = false;
            }
            
        } else if (container->type == NODE_ITEM) {
            
            if (indent >= container->as.list.marker_offset +
                container->as.list.padding) {
                offset += container->as.list.marker_offset +
                container->as.list.padding;
            } else if (blank) {
                offset = first_nonspace;
            } else {
                all_matched = false;
            }
            
        } else if (container->type == NODE_CODE_BLOCK) {
            
            if (!container->as.code.fenced) { // indented
                if (indent >= CODE_INDENT) {
                    offset += CODE_INDENT;
                } else if (blank) {
                    offset = first_nonspace;
                } else {
                    all_matched = false;
                }
            } else { // fenced have ``` or ~~~
                matched = 0;
                if (indent <= 3 &&
                    (peek_at(&input, first_nonspace) ==
                     container->as.code.fence_char)) {
                        matched = scan_close_code_fence(&input,first_nonspace);
                    }
                if (matched >= container->as.code.fence_length) {
                    // closing fence - and since we're at
                    // the end of a line, we can return:
                    all_matched = false;
                    offset += matched;
                    parser->current = finalize(parser, container);
                    goto finished;
                } else {
                    // skip opt. spaces of fence offset
                    i = container->as.code.fence_offset;
                    while (i > 0 &&
                           peek_at(&input, offset) == ' ') {
                        offset++;
                        i--;
                    }
                }
            }
        } else if (container->type == NODE_HEADER) {
            
            // a header can never contain more than one line
            all_matched = false;
            
        } else if (container->type == NODE_HTML) {
            
            if (blank) {
                all_matched = false;
            }
            
        } else if (container->type == NODE_PARAGRAPH) {
            if (blank) {
                all_matched = false;
            }
            
        }
        
        if (!all_matched) {
            container = container->parent;  // back up to last matching node
            break;
        }
    }
    
    last_matched_container = container;
    // check to see if we've hit 2nd blank line, break out of list:
    if (blank && container->last_line_blank) {
        break_out_of_lists(parser, &container);
    }
    
    maybe_lazy = parser->current->type == NODE_PARAGRAPH;
    // try new container starts:
    while (container->type != NODE_CODE_BLOCK &&
           container->type != NODE_HTML) {
        //first_nonspace has to be set selectively in each case
        first_nonspace = offset;
        while (peek_at(&input, first_nonspace) == ' ')
            first_nonspace++;
        
        indent = first_nonspace - offset;
        blank = peek_at(&input, first_nonspace) == '\n';
        
        if (indent >= CODE_INDENT) {
            if (!maybe_lazy && !blank) {
                offset += CODE_INDENT;
                container = add_child(parser, container, NODE_CODE_BLOCK, offset + 1);
                container->as.code.fenced = false;
                container->as.code.fence_char = 0;
                container->as.code.fence_length = 0;
                container->as.code.fence_offset = 0;
                container->as.code.info = cmark_chunk_literal("");
            } else { // indent > 4 in lazy line
                break;
            }
            
        } else if (peek_at(&input, first_nonspace) == '>') {
            
            offset = first_nonspace + 1;
            // optional following character
            if (peek_at(&input, offset) == ' ')
                offset++;
            container = add_child(parser, container, NODE_BLOCK_QUOTE, offset + 1);
            
        } else if ((matched = scan_atx_header_start(&input, first_nonspace))) {
            offset = first_nonspace + matched;
            container = add_child(parser, container, NODE_HEADER, offset + 1);
            
            int hashpos = cmark_chunk_strchr(&input, '#', first_nonspace);
            int level = 0;
            
            while (peek_at(&input, hashpos) == '#') {
                level++;
                hashpos++;
            }
            container->as.header.level = level;
            container->as.header.setext = false;
            
        } else if ((matched = scan_open_code_fence(&input, first_nonspace))) {
            
            container = add_child(parser, container, NODE_CODE_BLOCK, first_nonspace + 1);
            container->as.code.fenced = true;
            container->as.code.fence_char = peek_at(&input, first_nonspace);
            container->as.code.fence_length = matched;
            container->as.code.fence_offset = first_nonspace - offset;
            container->as.code.info = cmark_chunk_literal("");
            offset = first_nonspace + matched;
            
        } else if ((matched = scan_html_block_tag(&input, first_nonspace))) {
            
            container = add_child(parser, container, NODE_HTML, first_nonspace + 1);
            // note, we don't adjust offset because the tag is part of the text
            // a setext header is one of the form
            // header
            //-----/======
            //previously encountered the text so now parse the ==== and set the header fields
        } else if (container->type == NODE_PARAGRAPH &&
                   (lev = scan_setext_header_line(&input, first_nonspace)) &&
                   // check that there is only one line in the paragraph:
                   cmark_strbuf_strrchr(&container->string_content, '\n',cmark_strbuf_len(&container->string_content) - 2) < 0) {
                       //because header can contain only 1 line
                       container->type = NODE_HEADER;
                       container->as.header.level = lev;
                       container->as.header.setext = true;
                       offset = input.len - 1;
                       
                   } else if (!(container->type == NODE_PARAGRAPH && !all_matched) &&
                              (matched = scan_hrule(&input, first_nonspace))) {
                       
                       // it's only now that we know the line is not part of a setext header:
                       container = add_child(parser, container, NODE_HRULE, first_nonspace + 1);
                       container = finalize(parser, container);
                       offset = input.len - 1;
                       
                   } else if ((matched = parse_list_marker(&input, first_nonspace, &data))) {
                       
                       // compute padding:
                       offset = first_nonspace + matched;
                       i = 0;
                       while (i <= 5 && peek_at(&input, offset + i) == ' ') {
                           i++;
                       }
                       // i = number of spaces after marker, up to 5
                       if (i >= 5 || i < 1 || peek_at(&input, offset) == '\n') {
                           data->padding = matched + 1;
                           if (i > 0) {
                               offset += 1;
                           }
                       } else {
                           data->padding = matched + i;
                           offset += i;
                       }
                       
                       // check container; if it's a list, see if this list item
                       // can continue the list; otherwise, create a list container.
                       
                       data->marker_offset = indent;
                       
                       if (container->type != NODE_LIST ||
                           !lists_match(&container->as.list, data)) {
                           container = add_child(parser, container, NODE_LIST,first_nonspace + 1);
                           
                           memcpy(&container->as.list, data, sizeof(*data));
                       }
                       
                       // add the list item
                       container = add_child(parser, container, NODE_ITEM,first_nonspace + 1);
                       /* TODO: static */
                       memcpy(&container->as.list, data, sizeof(*data));
                       free(data);
                   } else {
                       break;
                   }
        
        if (accepts_lines(container->type)) {
            // if it's a line container, it can't contain other containers
            break;
        }
        maybe_lazy = false;
    }
    
    // what remains at offset is a text line.  add the text to the
    // appropriate container.
    
    first_nonspace = offset;
    while (peek_at(&input, first_nonspace) == ' ')
        first_nonspace++;
    
    indent = first_nonspace - offset;
    blank = peek_at(&input, first_nonspace) == '\n';
    
    if (blank && container->last_child) {
        container->last_child->last_line_blank = true;
    }
    
    // block quote lines are never blank as they start with >
    // and we don't count blanks in fenced code for purposes of tight/loose
    // lists or breaking out of lists.  we also don't set last_line_blank
    // on an empty list item.
    container->last_line_blank = (blank &&
                                  container->type != NODE_BLOCK_QUOTE &&
                                  container->type != NODE_HEADER &&
                                  !(container->type == NODE_CODE_BLOCK &&
                                    container->as.code.fenced) &&
                                  !(container->type == NODE_ITEM &&
                                    container->first_child == NULL &&
                                    container->start_line == parser->line_number));
    
    cmark_node *cont = container;
    while (cont->parent) {
        cont->parent->last_line_blank = false;
        cont = cont->parent;
    }
    //multiple lines in a paragraph initially all get added to the strbuf in the paragraph node
    if (parser->current != last_matched_container &&
        container == last_matched_container &&
        !blank &&
        parser->current->type == NODE_PARAGRAPH &&
        cmark_strbuf_len(&parser->current->string_content) > 0) {
        add_line(parser->current, &input, offset);
        
    } else { // not a lazy continuation
        // finalize any blocks that were not matched and set cur to container:
        while (parser->current != last_matched_container) {
            parser->current = finalize(parser, parser->current);
            assert(parser->current != NULL);
        }
        
        if (container->type == NODE_CODE_BLOCK ||
            container->type == NODE_HTML) {
            
            add_line(container, &input, offset);
            
        } else if (blank) {
            // ??? do nothing
            
        } else if (accepts_lines(container->type)) {
            //multiple lines in a paragraph initially all get added to the strbuf in the paragraph node
            if (container->type == NODE_HEADER &&
                container->as.header.setext == false) {
                chop_trailing_hashtags(&input);
            }
            add_line(container, &input, first_nonspace);
            
        } else {
            // create paragraph container for line
            container = add_child(parser, container, NODE_PARAGRAPH, first_nonspace + 1);
            add_line(container, &input, first_nonspace);
            
        }
        parser->current = container;
    }
finished:
    parser->last_line_length = parser->curline->size -
    (parser->curline->ptr[parser->curline->size - 1] == '\n' ?
     1 : 0);
    ;
    cmark_strbuf_clear(parser->curline);
}

cmark_node *find_first_non_include(cmark_node *document)
{
    cmark_iter *iter = cmark_iter_new(document);
    cmark_event_type ev_type;
    while((ev_type = cmark_iter_next(iter))!=CMARK_EVENT_DONE)
    {
        if(ev_type==CMARK_EVENT_ENTER)
        {
            cmark_node *node = cmark_iter_get_node(iter);
            if(node->type!=CMARK_NODE_INCLUDE && node->type!=CMARK_NODE_DOCUMENT)
            {
                return node;
            }
        }
    }
    return NULL;
}

void cmark_add_to_head(cmark_node *node,char *filename)
{
//    printf("node->type = %s\n",cmark_node_get_type_string(node));
    if(node->type!=NODE_DOCUMENT)
    {
        fprintf(stderr,"Head can only be added to document node \n");
        exit(1);
    }
    assert(node->type==NODE_DOCUMENT);
    cmark_node *new_include = cmark_node_new(NODE_INCLUDE);
//    printf("%p \n",new_include);
//    printf("filename = %s \n",filename);
    if(!cmark_node_set_literal(new_include,filename))
    {
        fprintf(stderr,"could not set literal \n");
        exit(1);
    }
    if(node->first_child->type!=NODE_HEAD)
    {
//        printf("Doc did not have a head \n");
//        node->type = NODE_BODY;
//        cmark_node *new_root = cmark_node_new(NODE_DOCUMENT);
//        cmark_node_append_child(new_root,node);
//        print_nodes(new_root);
//        new_root->start_line = node->start_line;
//        new_root->start_column = node->start_column;
//        new_root->end_line = node->end_line;
//        new_root->end_column = node->end_column;
//        new_root->open = node->open;
//        new_root->last_line_blank = node->last_line_blank;
        cmark_node_prepend_child(node,cmark_node_new(NODE_HEAD));
//        printf("*********\n");
//        printf("YOOHOO!\n");
        cmark_node_append_child(node->first_child,new_include);
////        printf("Append returned %d \n",ret);
////        print_nodes(new_root);
////        printf("new root is of type %s \n",cmark_node_get_type_string(new_root));
////        printf("parent is of type %s \n",cmark_node_get_type_string(node->parent));
//        assert(new_root==node->parent);
//        printf("Node is of type %s \n",cmark_node_get_type_string(node));
//        return node->parent;
    }
    else
    {
        cmark_node_append_child(node->first_child,new_include);
//        printf("*********\n");
//        print_nodes(new_root);
//        return node;
    }

}

void cmark_include_files(cmark_node *document,char **argv, int *includes, int numincludes)
{
    for(int i=0;i<numincludes;i++)
    {
        cmark_add_to_head(document,argv[includes[i]]);
//        printf("TEMP\n");
//        print_nodes(document);
//        document = temp;
    }
}

void print_nodes(cmark_node *root)
{
    cmark_event_type ev_type;
    cmark_iter *iter = cmark_iter_new(root);
    while((ev_type = cmark_iter_next(iter))!=CMARK_EVENT_DONE)
    {
        cmark_node *cur = cmark_iter_get_node(iter);
        printf("Node is of type %s and event_type = %d \n",cmark_node_get_type_string(cur),ev_type);
        if(cur->type==NODE_INCLUDE)
            printf("%s \n",cmark_node_get_literal(cur));
    }
    
    cmark_iter_free(iter);
}

cmark_node *cmark_parser_finish(cmark_parser *parser)
{
    if (parser->linebuf->size) {
        S_process_line(parser, parser->linebuf->ptr,
                       parser->linebuf->size);
        cmark_strbuf_clear(parser->linebuf);
    }
    finalize_document(parser);
    
    if (parser->options & CMARK_OPT_NORMALIZE) {
        cmark_consolidate_text_nodes(parser->root);
    }
    
    cmark_strbuf_free(parser->curline);
    
#if CMARK_DEBUG_NODES
    if (cmark_node_check(parser->root, stderr)) {
        abort();
    }
#endif
    return parser->root;
}
