vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Keepsake/cmake-helpers
  REF 766b2bcab0f8335603ae569e6638efac60f48fbd
  SHA512 434e517dde19e2b52040eddf7428c6f9af38421405616eee9d7ae7b999d36898384a212dbc868b3393f9fd4e258aefb1f3c98fa4aaae64d3b3aa6a3948b301f9
  HEAD_REF unstable
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME KsCMakeHelpers)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(
  INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)
