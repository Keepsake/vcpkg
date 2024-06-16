vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/serialization
	REF beba9676bbf15cf0d32dbaf88f71103df57e8203
  SHA512 c93ebad869ad87542c4d9c3228a3a3599ef57161b39143c28c51633d7fc21b3d2fda1ce288a3e1c9e6523a2aea3ad955ec4b6b66443dcef37185b28cd0313c4a
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
