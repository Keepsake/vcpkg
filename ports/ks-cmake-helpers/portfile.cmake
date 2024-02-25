vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Keepsake/cmake-helpers
  REF 1.1.0
  HEAD_REF develop
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
