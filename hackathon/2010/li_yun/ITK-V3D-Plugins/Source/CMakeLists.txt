
INCLUDE_DIRECTORIES(
  Common
  ${V3D_BASIC_C_FUN_SOURCE_DIR}
  )

ADD_SUBDIRECTORY(
  ${V3D_BASIC_C_FUN_SOURCE_DIR}
  ${V3D_BASIC_C_FUN_BINARY_DIR}
  )

ADD_SUBDIRECTORY(Common)
#ADD_SUBDIRECTORY(RegistrationDlg)
ADD_SUBDIRECTORY(RegistrationIntegrated)
#ADD_SUBDIRECTORY(Arithmetic)
#ADD_SUBDIRECTORY(BinaryLogic)
#ADD_SUBDIRECTORY(IntensityTransformation)
#ADD_SUBDIRECTORY(MathMorphology)
#ADD_SUBDIRECTORY(Smoothing)
#ADD_SUBDIRECTORY(Thresholding)
#ADD_SUBDIRECTORY(EdgeDetection)
#ADD_SUBDIRECTORY(LevelSets)
#ADD_SUBDIRECTORY(LoadData)
#ADD_SUBDIRECTORY(RegionGrowing)
#ADD_SUBDIRECTORY(Classification)
#ADD_SUBDIRECTORY(Registration)
#ADD_SUBDIRECTORY(ImageObjects)
#ADD_SUBDIRECTORY(Watershed)
#ADD_SUBDIRECTORY(DistanceMaps)


