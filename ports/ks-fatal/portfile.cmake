vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/fatal
	REF 2eafa07f426ac3de76edfdc6edcd4278c8ac435b
  SHA512 fabd1e29586c38933e3cbe8bd96023b7e65d143654ab8d93abaa3e443839f2c3b86dd91eaa1624022f015b16ef0fab0acc828ebdf92ac6de8c4da9b27bff447b
	HEAD_REF unstable
)

vcpkg_cmake_configure(
  SOURCE_PATH
    "${SOURCE_PATH}"
  OPTIONS
    -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME KsFatal)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(
  INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)
