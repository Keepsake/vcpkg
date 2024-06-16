vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/serialization
	REF 6038de477536543d6b4a0b87098489aef80e7be4
  SHA512 afad2a17247326b8daecc510a59b8d164ab2e68a8b7045fb37ab632f67352aa2f222e4aedc0c138fbf27eea23ecf99c988b1904f75950978020ffbd1e9338ea4
	HEAD_REF unstable
)

vcpkg_cmake_configure(
  SOURCE_PATH
    "${SOURCE_PATH}"
  OPTIONS
    -DBUILD_TESTING=OFF
    -DBUILD_BENCHMARK=OFF
)

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME KsSerialization)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(
  INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)
