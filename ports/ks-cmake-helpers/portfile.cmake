vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Keepsake/cmake-helpers
  REF 813379cd34838d287703835af8d0a8d1397e89d4
  SHA512 3022f1f7178b7695e35920cada685b0a59f6552f41ccb336b80fc01e9292373f03f343d583bac06e599338024599e6610dd7ec8c115c3ef788b6f97d692f33c6
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
