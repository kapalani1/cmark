# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/karthic/cmark

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/karthic/cmark/build

# Include any dependencies generated for this target.
include src/CMakeFiles/libcmark_static.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/libcmark_static.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/libcmark_static.dir/flags.make

src/CMakeFiles/libcmark_static.dir/cmark.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/cmark.c.o: ../src/cmark.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/cmark.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/cmark.c.o   -c /Users/karthic/cmark/src/cmark.c

src/CMakeFiles/libcmark_static.dir/cmark.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/cmark.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/cmark.c > CMakeFiles/libcmark_static.dir/cmark.c.i

src/CMakeFiles/libcmark_static.dir/cmark.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/cmark.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/cmark.c -o CMakeFiles/libcmark_static.dir/cmark.c.s

src/CMakeFiles/libcmark_static.dir/cmark.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/cmark.c.o.requires

src/CMakeFiles/libcmark_static.dir/cmark.c.o.provides: src/CMakeFiles/libcmark_static.dir/cmark.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/cmark.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/cmark.c.o.provides

src/CMakeFiles/libcmark_static.dir/cmark.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/cmark.c.o

src/CMakeFiles/libcmark_static.dir/node.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/node.c.o: ../src/node.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/node.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/node.c.o   -c /Users/karthic/cmark/src/node.c

src/CMakeFiles/libcmark_static.dir/node.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/node.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/node.c > CMakeFiles/libcmark_static.dir/node.c.i

src/CMakeFiles/libcmark_static.dir/node.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/node.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/node.c -o CMakeFiles/libcmark_static.dir/node.c.s

src/CMakeFiles/libcmark_static.dir/node.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/node.c.o.requires

src/CMakeFiles/libcmark_static.dir/node.c.o.provides: src/CMakeFiles/libcmark_static.dir/node.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/node.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/node.c.o.provides

src/CMakeFiles/libcmark_static.dir/node.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/node.c.o

src/CMakeFiles/libcmark_static.dir/iterator.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/iterator.c.o: ../src/iterator.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/iterator.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/iterator.c.o   -c /Users/karthic/cmark/src/iterator.c

src/CMakeFiles/libcmark_static.dir/iterator.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/iterator.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/iterator.c > CMakeFiles/libcmark_static.dir/iterator.c.i

src/CMakeFiles/libcmark_static.dir/iterator.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/iterator.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/iterator.c -o CMakeFiles/libcmark_static.dir/iterator.c.s

src/CMakeFiles/libcmark_static.dir/iterator.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/iterator.c.o.requires

src/CMakeFiles/libcmark_static.dir/iterator.c.o.provides: src/CMakeFiles/libcmark_static.dir/iterator.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/iterator.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/iterator.c.o.provides

src/CMakeFiles/libcmark_static.dir/iterator.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/iterator.c.o

src/CMakeFiles/libcmark_static.dir/blocks.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/blocks.c.o: ../src/blocks.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/blocks.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/blocks.c.o   -c /Users/karthic/cmark/src/blocks.c

src/CMakeFiles/libcmark_static.dir/blocks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/blocks.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/blocks.c > CMakeFiles/libcmark_static.dir/blocks.c.i

src/CMakeFiles/libcmark_static.dir/blocks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/blocks.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/blocks.c -o CMakeFiles/libcmark_static.dir/blocks.c.s

src/CMakeFiles/libcmark_static.dir/blocks.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/blocks.c.o.requires

src/CMakeFiles/libcmark_static.dir/blocks.c.o.provides: src/CMakeFiles/libcmark_static.dir/blocks.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/blocks.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/blocks.c.o.provides

src/CMakeFiles/libcmark_static.dir/blocks.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/blocks.c.o

src/CMakeFiles/libcmark_static.dir/inlines.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/inlines.c.o: ../src/inlines.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/inlines.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/inlines.c.o   -c /Users/karthic/cmark/src/inlines.c

src/CMakeFiles/libcmark_static.dir/inlines.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/inlines.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/inlines.c > CMakeFiles/libcmark_static.dir/inlines.c.i

src/CMakeFiles/libcmark_static.dir/inlines.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/inlines.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/inlines.c -o CMakeFiles/libcmark_static.dir/inlines.c.s

src/CMakeFiles/libcmark_static.dir/inlines.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/inlines.c.o.requires

src/CMakeFiles/libcmark_static.dir/inlines.c.o.provides: src/CMakeFiles/libcmark_static.dir/inlines.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/inlines.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/inlines.c.o.provides

src/CMakeFiles/libcmark_static.dir/inlines.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/inlines.c.o

src/CMakeFiles/libcmark_static.dir/scanners.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/scanners.c.o: ../src/scanners.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/scanners.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/scanners.c.o   -c /Users/karthic/cmark/src/scanners.c

src/CMakeFiles/libcmark_static.dir/scanners.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/scanners.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/scanners.c > CMakeFiles/libcmark_static.dir/scanners.c.i

src/CMakeFiles/libcmark_static.dir/scanners.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/scanners.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/scanners.c -o CMakeFiles/libcmark_static.dir/scanners.c.s

src/CMakeFiles/libcmark_static.dir/scanners.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/scanners.c.o.requires

src/CMakeFiles/libcmark_static.dir/scanners.c.o.provides: src/CMakeFiles/libcmark_static.dir/scanners.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/scanners.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/scanners.c.o.provides

src/CMakeFiles/libcmark_static.dir/scanners.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/scanners.c.o

src/CMakeFiles/libcmark_static.dir/utf8.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/utf8.c.o: ../src/utf8.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/utf8.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/utf8.c.o   -c /Users/karthic/cmark/src/utf8.c

src/CMakeFiles/libcmark_static.dir/utf8.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/utf8.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/utf8.c > CMakeFiles/libcmark_static.dir/utf8.c.i

src/CMakeFiles/libcmark_static.dir/utf8.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/utf8.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/utf8.c -o CMakeFiles/libcmark_static.dir/utf8.c.s

src/CMakeFiles/libcmark_static.dir/utf8.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/utf8.c.o.requires

src/CMakeFiles/libcmark_static.dir/utf8.c.o.provides: src/CMakeFiles/libcmark_static.dir/utf8.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/utf8.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/utf8.c.o.provides

src/CMakeFiles/libcmark_static.dir/utf8.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/utf8.c.o

src/CMakeFiles/libcmark_static.dir/buffer.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/buffer.c.o: ../src/buffer.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/buffer.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/buffer.c.o   -c /Users/karthic/cmark/src/buffer.c

src/CMakeFiles/libcmark_static.dir/buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/buffer.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/buffer.c > CMakeFiles/libcmark_static.dir/buffer.c.i

src/CMakeFiles/libcmark_static.dir/buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/buffer.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/buffer.c -o CMakeFiles/libcmark_static.dir/buffer.c.s

src/CMakeFiles/libcmark_static.dir/buffer.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/buffer.c.o.requires

src/CMakeFiles/libcmark_static.dir/buffer.c.o.provides: src/CMakeFiles/libcmark_static.dir/buffer.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/buffer.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/buffer.c.o.provides

src/CMakeFiles/libcmark_static.dir/buffer.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/buffer.c.o

src/CMakeFiles/libcmark_static.dir/references.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/references.c.o: ../src/references.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/references.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/references.c.o   -c /Users/karthic/cmark/src/references.c

src/CMakeFiles/libcmark_static.dir/references.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/references.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/references.c > CMakeFiles/libcmark_static.dir/references.c.i

src/CMakeFiles/libcmark_static.dir/references.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/references.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/references.c -o CMakeFiles/libcmark_static.dir/references.c.s

src/CMakeFiles/libcmark_static.dir/references.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/references.c.o.requires

src/CMakeFiles/libcmark_static.dir/references.c.o.provides: src/CMakeFiles/libcmark_static.dir/references.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/references.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/references.c.o.provides

src/CMakeFiles/libcmark_static.dir/references.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/references.c.o

src/CMakeFiles/libcmark_static.dir/man.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/man.c.o: ../src/man.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/man.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/man.c.o   -c /Users/karthic/cmark/src/man.c

src/CMakeFiles/libcmark_static.dir/man.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/man.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/man.c > CMakeFiles/libcmark_static.dir/man.c.i

src/CMakeFiles/libcmark_static.dir/man.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/man.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/man.c -o CMakeFiles/libcmark_static.dir/man.c.s

src/CMakeFiles/libcmark_static.dir/man.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/man.c.o.requires

src/CMakeFiles/libcmark_static.dir/man.c.o.provides: src/CMakeFiles/libcmark_static.dir/man.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/man.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/man.c.o.provides

src/CMakeFiles/libcmark_static.dir/man.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/man.c.o

src/CMakeFiles/libcmark_static.dir/xml.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/xml.c.o: ../src/xml.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/xml.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/xml.c.o   -c /Users/karthic/cmark/src/xml.c

src/CMakeFiles/libcmark_static.dir/xml.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/xml.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/xml.c > CMakeFiles/libcmark_static.dir/xml.c.i

src/CMakeFiles/libcmark_static.dir/xml.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/xml.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/xml.c -o CMakeFiles/libcmark_static.dir/xml.c.s

src/CMakeFiles/libcmark_static.dir/xml.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/xml.c.o.requires

src/CMakeFiles/libcmark_static.dir/xml.c.o.provides: src/CMakeFiles/libcmark_static.dir/xml.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/xml.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/xml.c.o.provides

src/CMakeFiles/libcmark_static.dir/xml.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/xml.c.o

src/CMakeFiles/libcmark_static.dir/html.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/html.c.o: ../src/html.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/html.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/html.c.o   -c /Users/karthic/cmark/src/html.c

src/CMakeFiles/libcmark_static.dir/html.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/html.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/html.c > CMakeFiles/libcmark_static.dir/html.c.i

src/CMakeFiles/libcmark_static.dir/html.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/html.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/html.c -o CMakeFiles/libcmark_static.dir/html.c.s

src/CMakeFiles/libcmark_static.dir/html.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/html.c.o.requires

src/CMakeFiles/libcmark_static.dir/html.c.o.provides: src/CMakeFiles/libcmark_static.dir/html.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/html.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/html.c.o.provides

src/CMakeFiles/libcmark_static.dir/html.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/html.c.o

src/CMakeFiles/libcmark_static.dir/commonmark.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/commonmark.c.o: ../src/commonmark.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/commonmark.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/commonmark.c.o   -c /Users/karthic/cmark/src/commonmark.c

src/CMakeFiles/libcmark_static.dir/commonmark.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/commonmark.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/commonmark.c > CMakeFiles/libcmark_static.dir/commonmark.c.i

src/CMakeFiles/libcmark_static.dir/commonmark.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/commonmark.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/commonmark.c -o CMakeFiles/libcmark_static.dir/commonmark.c.s

src/CMakeFiles/libcmark_static.dir/commonmark.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/commonmark.c.o.requires

src/CMakeFiles/libcmark_static.dir/commonmark.c.o.provides: src/CMakeFiles/libcmark_static.dir/commonmark.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/commonmark.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/commonmark.c.o.provides

src/CMakeFiles/libcmark_static.dir/commonmark.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/commonmark.c.o

src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o: ../src/houdini_href_e.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_14)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/houdini_href_e.c.o   -c /Users/karthic/cmark/src/houdini_href_e.c

src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/houdini_href_e.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/houdini_href_e.c > CMakeFiles/libcmark_static.dir/houdini_href_e.c.i

src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/houdini_href_e.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/houdini_href_e.c -o CMakeFiles/libcmark_static.dir/houdini_href_e.c.s

src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.requires

src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.provides: src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.provides

src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o

src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o: ../src/houdini_html_e.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_15)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/houdini_html_e.c.o   -c /Users/karthic/cmark/src/houdini_html_e.c

src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/houdini_html_e.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/houdini_html_e.c > CMakeFiles/libcmark_static.dir/houdini_html_e.c.i

src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/houdini_html_e.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/houdini_html_e.c -o CMakeFiles/libcmark_static.dir/houdini_html_e.c.s

src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.requires

src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.provides: src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.provides

src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o

src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o: ../src/houdini_html_u.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_16)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/houdini_html_u.c.o   -c /Users/karthic/cmark/src/houdini_html_u.c

src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/houdini_html_u.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/houdini_html_u.c > CMakeFiles/libcmark_static.dir/houdini_html_u.c.i

src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/houdini_html_u.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/houdini_html_u.c -o CMakeFiles/libcmark_static.dir/houdini_html_u.c.s

src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.requires

src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.provides: src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.provides

src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o

src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o: src/CMakeFiles/libcmark_static.dir/flags.make
src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o: ../src/cmark_ctype.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/karthic/cmark/build/CMakeFiles $(CMAKE_PROGRESS_17)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libcmark_static.dir/cmark_ctype.c.o   -c /Users/karthic/cmark/src/cmark_ctype.c

src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libcmark_static.dir/cmark_ctype.c.i"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/karthic/cmark/src/cmark_ctype.c > CMakeFiles/libcmark_static.dir/cmark_ctype.c.i

src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libcmark_static.dir/cmark_ctype.c.s"
	cd /Users/karthic/cmark/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/karthic/cmark/src/cmark_ctype.c -o CMakeFiles/libcmark_static.dir/cmark_ctype.c.s

src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.requires:
.PHONY : src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.requires

src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.provides: src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.requires
	$(MAKE) -f src/CMakeFiles/libcmark_static.dir/build.make src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.provides.build
.PHONY : src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.provides

src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.provides.build: src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o

# Object files for target libcmark_static
libcmark_static_OBJECTS = \
"CMakeFiles/libcmark_static.dir/cmark.c.o" \
"CMakeFiles/libcmark_static.dir/node.c.o" \
"CMakeFiles/libcmark_static.dir/iterator.c.o" \
"CMakeFiles/libcmark_static.dir/blocks.c.o" \
"CMakeFiles/libcmark_static.dir/inlines.c.o" \
"CMakeFiles/libcmark_static.dir/scanners.c.o" \
"CMakeFiles/libcmark_static.dir/utf8.c.o" \
"CMakeFiles/libcmark_static.dir/buffer.c.o" \
"CMakeFiles/libcmark_static.dir/references.c.o" \
"CMakeFiles/libcmark_static.dir/man.c.o" \
"CMakeFiles/libcmark_static.dir/xml.c.o" \
"CMakeFiles/libcmark_static.dir/html.c.o" \
"CMakeFiles/libcmark_static.dir/commonmark.c.o" \
"CMakeFiles/libcmark_static.dir/houdini_href_e.c.o" \
"CMakeFiles/libcmark_static.dir/houdini_html_e.c.o" \
"CMakeFiles/libcmark_static.dir/houdini_html_u.c.o" \
"CMakeFiles/libcmark_static.dir/cmark_ctype.c.o"

# External object files for target libcmark_static
libcmark_static_EXTERNAL_OBJECTS =

src/libcmark.a: src/CMakeFiles/libcmark_static.dir/cmark.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/node.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/iterator.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/blocks.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/inlines.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/scanners.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/utf8.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/buffer.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/references.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/man.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/xml.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/html.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/commonmark.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/build.make
src/libcmark.a: src/CMakeFiles/libcmark_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libcmark.a"
	cd /Users/karthic/cmark/build/src && $(CMAKE_COMMAND) -P CMakeFiles/libcmark_static.dir/cmake_clean_target.cmake
	cd /Users/karthic/cmark/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libcmark_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/libcmark_static.dir/build: src/libcmark.a
.PHONY : src/CMakeFiles/libcmark_static.dir/build

src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/cmark.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/node.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/iterator.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/blocks.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/inlines.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/scanners.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/utf8.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/buffer.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/references.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/man.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/xml.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/html.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/commonmark.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/houdini_href_e.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/houdini_html_e.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/houdini_html_u.c.o.requires
src/CMakeFiles/libcmark_static.dir/requires: src/CMakeFiles/libcmark_static.dir/cmark_ctype.c.o.requires
.PHONY : src/CMakeFiles/libcmark_static.dir/requires

src/CMakeFiles/libcmark_static.dir/clean:
	cd /Users/karthic/cmark/build/src && $(CMAKE_COMMAND) -P CMakeFiles/libcmark_static.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/libcmark_static.dir/clean

src/CMakeFiles/libcmark_static.dir/depend:
	cd /Users/karthic/cmark/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/karthic/cmark /Users/karthic/cmark/src /Users/karthic/cmark/build /Users/karthic/cmark/build/src /Users/karthic/cmark/build/src/CMakeFiles/libcmark_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/libcmark_static.dir/depend

