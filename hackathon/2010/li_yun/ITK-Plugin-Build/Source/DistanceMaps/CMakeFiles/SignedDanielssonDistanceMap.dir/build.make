# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build

# Include any dependencies generated for this target.
include Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/depend.make

# Include the progress variables for this target.
include Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/progress.make

# Include the compile flags for this target's objects.
include Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/flags.make

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/flags.make
Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o: /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps/SignedDanielssonDistanceMap.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o -c /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps/SignedDanielssonDistanceMap.cxx

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.i"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps/SignedDanielssonDistanceMap.cxx > CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.i

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.s"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps/SignedDanielssonDistanceMap.cxx -o CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.s

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.requires:
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.requires

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.provides: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.requires
	$(MAKE) -f Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/build.make Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.provides.build
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.provides

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.provides.build: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.provides.build

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/flags.make
Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o: Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o -c /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.i"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx > CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.i

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.s"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx -o CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.s

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.requires:
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.requires

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.provides: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.requires
	$(MAKE) -f Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/build.make Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.provides.build
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.provides

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.provides.build: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.provides.build

Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx: /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps/SignedDanielssonDistanceMap.h
	$(CMAKE_COMMAND) -E cmake_progress_report /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating moc_SignedDanielssonDistanceMap.cxx"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/moc-qt4 -I/home/liyun/V3D/v3d_main/basic_c_fun/../common_lib/include -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Review/Statistics -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Review -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/gdcm/src -I/home/liyun/ITK/ITK-bin/Utilities/gdcm -I/home/liyun/ITK/ITK-bin/Utilities/vxl/core -I/home/liyun/ITK/ITK-bin/Utilities/vxl/vcl -I/home/liyun/ITK/ITK-bin/Utilities/vxl/v3p/netlib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/vxl/core -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/vxl/vcl -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/vxl/v3p/netlib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities -I/home/liyun/ITK/ITK-bin/Utilities -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/itkExtHdrs -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/nifti/znzlib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/nifti/niftilib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/expat -I/home/liyun/ITK/ITK-bin/Utilities/expat -I/home/liyun/ITK/ITK-bin/Utilities/DICOMParser -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/DICOMParser -I/home/liyun/ITK/ITK-bin/Utilities/NrrdIO -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/NrrdIO -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/MetaIO -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/SpatialObject -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Numerics/NeuralNetworks -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Numerics/FEM -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/IO -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Numerics -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Common -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/BasicFilters -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Algorithms -I/home/liyun/ITK/ITK-bin -I/usr/include/qt4 -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtCore -I/home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Common -I/home/liyun/V3D/v3d_main/basic_c_fun -I/home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins -DQT_GUI_LIB -DQT_CORE_LIB -o /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps/SignedDanielssonDistanceMap.h

# Object files for target SignedDanielssonDistanceMap
SignedDanielssonDistanceMap_OBJECTS = \
"CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o" \
"CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o"

# External object files for target SignedDanielssonDistanceMap
SignedDanielssonDistanceMap_EXTERNAL_OBJECTS =

bin/libSignedDanielssonDistanceMap.so: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o
bin/libSignedDanielssonDistanceMap.so: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o
bin/libSignedDanielssonDistanceMap.so: bin/libV3DInterface.a
bin/libSignedDanielssonDistanceMap.so: bin/libV3DITKCommon.a
bin/libSignedDanielssonDistanceMap.so: /usr/lib/libQtGui.so
bin/libSignedDanielssonDistanceMap.so: /usr/lib/libQtCore.so
bin/libSignedDanielssonDistanceMap.so: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/build.make
bin/libSignedDanielssonDistanceMap.so: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../bin/libSignedDanielssonDistanceMap.so"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SignedDanielssonDistanceMap.dir/link.txt --verbose=$(VERBOSE)
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && /usr/bin/cmake -E copy /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/bin/libSignedDanielssonDistanceMap.so /home/liyun/V3D/v3d/plugins/ITK//DistanceMaps/SignedDanielssonDistanceMap/SignedDanielssonDistanceMap.so

# Rule to build all files generated by this target.
Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/build: bin/libSignedDanielssonDistanceMap.so
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/build

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/requires: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/SignedDanielssonDistanceMap.o.requires
Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/requires: Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/moc_SignedDanielssonDistanceMap.o.requires
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/requires

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/clean:
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps && $(CMAKE_COMMAND) -P CMakeFiles/SignedDanielssonDistanceMap.dir/cmake_clean.cmake
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/clean

Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/depend: Source/DistanceMaps/moc_SignedDanielssonDistanceMap.cxx
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/DistanceMaps /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Source/DistanceMaps/CMakeFiles/SignedDanielssonDistanceMap.dir/depend

