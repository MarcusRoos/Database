# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2019.2.5\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2019.2.5\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/PostgreSQLTest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/PostgreSQLTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PostgreSQLTest.dir/flags.make

CMakeFiles/PostgreSQLTest.dir/main.cpp.obj: CMakeFiles/PostgreSQLTest.dir/flags.make
CMakeFiles/PostgreSQLTest.dir/main.cpp.obj: CMakeFiles/PostgreSQLTest.dir/includes_CXX.rsp
CMakeFiles/PostgreSQLTest.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PostgreSQLTest.dir/main.cpp.obj"
	C:\MinGW\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\PostgreSQLTest.dir\main.cpp.obj -c C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\main.cpp

CMakeFiles/PostgreSQLTest.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PostgreSQLTest.dir/main.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\main.cpp > CMakeFiles\PostgreSQLTest.dir\main.cpp.i

CMakeFiles/PostgreSQLTest.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PostgreSQLTest.dir/main.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\main.cpp -o CMakeFiles\PostgreSQLTest.dir\main.cpp.s

# Object files for target PostgreSQLTest
PostgreSQLTest_OBJECTS = \
"CMakeFiles/PostgreSQLTest.dir/main.cpp.obj"

# External object files for target PostgreSQLTest
PostgreSQLTest_EXTERNAL_OBJECTS =

PostgreSQLTest.exe: CMakeFiles/PostgreSQLTest.dir/main.cpp.obj
PostgreSQLTest.exe: CMakeFiles/PostgreSQLTest.dir/build.make
PostgreSQLTest.exe: C:/Program\ Files\ (x86)/PostgreSQL/10/lib/libpq.dll
PostgreSQLTest.exe: CMakeFiles/PostgreSQLTest.dir/linklibs.rsp
PostgreSQLTest.exe: CMakeFiles/PostgreSQLTest.dir/objects1.rsp
PostgreSQLTest.exe: CMakeFiles/PostgreSQLTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable PostgreSQLTest.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\PostgreSQLTest.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PostgreSQLTest.dir/build: PostgreSQLTest.exe

.PHONY : CMakeFiles/PostgreSQLTest.dir/build

CMakeFiles/PostgreSQLTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\PostgreSQLTest.dir\cmake_clean.cmake
.PHONY : CMakeFiles/PostgreSQLTest.dir/clean

CMakeFiles/PostgreSQLTest.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\cmake-build-debug C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\cmake-build-debug C:\Users\Satan\Desktop\Skola\Universitet\Aktuella_kurser\Databas\Lektion_8\Clion-databas\cmake-build-debug\CMakeFiles\PostgreSQLTest.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PostgreSQLTest.dir/depend

