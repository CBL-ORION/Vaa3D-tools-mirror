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
include Source/Smoothing/CMakeFiles/MeanFilter.dir/depend.make

# Include the progress variables for this target.
include Source/Smoothing/CMakeFiles/MeanFilter.dir/progress.make

# Include the compile flags for this target's objects.
include Source/Smoothing/CMakeFiles/MeanFilter.dir/flags.make

Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o: Source/Smoothing/CMakeFiles/MeanFilter.dir/flags.make
Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o: /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing/MeanFilter.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/MeanFilter.dir/MeanFilter.o -c /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing/MeanFilter.cxx

Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MeanFilter.dir/MeanFilter.i"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing/MeanFilter.cxx > CMakeFiles/MeanFilter.dir/MeanFilter.i

Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MeanFilter.dir/MeanFilter.s"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing/MeanFilter.cxx -o CMakeFiles/MeanFilter.dir/MeanFilter.s

Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.requires:
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.requires

Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.provides: Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.requires
	$(MAKE) -f Source/Smoothing/CMakeFiles/MeanFilter.dir/build.make Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.provides.build
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.provides

Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.provides.build: Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.provides.build

Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o: Source/Smoothing/CMakeFiles/MeanFilter.dir/flags.make
Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o: Source/Smoothing/moc_MeanFilter.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/MeanFilter.dir/moc_MeanFilter.o -c /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing/moc_MeanFilter.cxx

Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MeanFilter.dir/moc_MeanFilter.i"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing/moc_MeanFilter.cxx > CMakeFiles/MeanFilter.dir/moc_MeanFilter.i

Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MeanFilter.dir/moc_MeanFilter.s"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing/moc_MeanFilter.cxx -o CMakeFiles/MeanFilter.dir/moc_MeanFilter.s

Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.requires:
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.requires

Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.provides: Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.requires
	$(MAKE) -f Source/Smoothing/CMakeFiles/MeanFilter.dir/build.make Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.provides.build
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.provides

Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.provides.build: Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.provides.build

Source/Smoothing/moc_MeanFilter.cxx: /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing/MeanFilter.h
	$(CMAKE_COMMAND) -E cmake_progress_report /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating moc_MeanFilter.cxx"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/moc-qt4 -I/home/liyun/V3D/v3d_main/basic_c_fun/../common_lib/include -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Review/Statistics -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Review -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/gdcm/src -I/home/liyun/ITK/ITK-bin/Utilities/gdcm -I/home/liyun/ITK/ITK-bin/Utilities/vxl/core -I/home/liyun/ITK/ITK-bin/Utilities/vxl/vcl -I/home/liyun/ITK/ITK-bin/Utilities/vxl/v3p/netlib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/vxl/core -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/vxl/vcl -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/vxl/v3p/netlib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities -I/home/liyun/ITK/ITK-bin/Utilities -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/itkExtHdrs -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/nifti/znzlib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/nifti/niftilib -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/expat -I/home/liyun/ITK/ITK-bin/Utilities/expat -I/home/liyun/ITK/ITK-bin/Utilities/DICOMParser -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/DICOMParser -I/home/liyun/ITK/ITK-bin/Utilities/NrrdIO -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/NrrdIO -I/home/liyun/ITK/InsightToolkit-3.20.0/Utilities/MetaIO -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/SpatialObject -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Numerics/NeuralNetworks -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Numerics/FEM -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/IO -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Numerics -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Common -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/BasicFilters -I/home/liyun/ITK/InsightToolkit-3.20.0/Code/Algorithms -I/home/liyun/ITK/ITK-bin -I/usr/include/qt4 -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtCore -I/home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Common -I/home/liyun/V3D/v3d_main/basic_c_fun -I/home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins -DQT_GUI_LIB -DQT_CORE_LIB -o /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing/moc_MeanFilter.cxx /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing/MeanFilter.h

# Object files for target MeanFilter
MeanFilter_OBJECTS = \
"CMakeFiles/MeanFilter.dir/MeanFilter.o" \
"CMakeFiles/MeanFilter.dir/moc_MeanFilter.o"

# External object files for target MeanFilter
MeanFilter_EXTERNAL_OBJECTS =

bin/libMeanFilter.so: Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o
bin/libMeanFilter.so: Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o
bin/libMeanFilter.so: bin/libV3DInterface.a
bin/libMeanFilter.so: bin/libV3DITKCommon.a
bin/libMeanFilter.so: /usr/lib/libQtGui.so
bin/libMeanFilter.so: /usr/lib/libQtCore.so
bin/libMeanFilter.so: Source/Smoothing/CMakeFiles/MeanFilter.dir/build.make
bin/libMeanFilter.so: Source/Smoothing/CMakeFiles/MeanFilter.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../bin/libMeanFilter.so"
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MeanFilter.dir/link.txt --verbose=$(VERBOSE)
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && /usr/bin/cmake -E copy /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/bin/libMeanFilter.so /home/liyun/V3D/v3d/plugins/ITK//Smoothing/MeanFilter/MeanFilter.so

# Rule to build all files generated by this target.
Source/Smoothing/CMakeFiles/MeanFilter.dir/build: bin/libMeanFilter.so
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/build

Source/Smoothing/CMakeFiles/MeanFilter.dir/requires: Source/Smoothing/CMakeFiles/MeanFilter.dir/MeanFilter.o.requires
Source/Smoothing/CMakeFiles/MeanFilter.dir/requires: Source/Smoothing/CMakeFiles/MeanFilter.dir/moc_MeanFilter.o.requires
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/requires

Source/Smoothing/CMakeFiles/MeanFilter.dir/clean:
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing && $(CMAKE_COMMAND) -P CMakeFiles/MeanFilter.dir/cmake_clean.cmake
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/clean

Source/Smoothing/CMakeFiles/MeanFilter.dir/depend: Source/Smoothing/moc_MeanFilter.cxx
	cd /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins /home/liyun/V3D/2010_hackathon/li_yun/ITK-V3D-Plugins/Source/Smoothing /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing /home/liyun/V3D/2010_hackathon/li_yun/ITK-Plugin-Build/Source/Smoothing/CMakeFiles/MeanFilter.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Source/Smoothing/CMakeFiles/MeanFilter.dir/depend

