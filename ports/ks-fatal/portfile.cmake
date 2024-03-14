vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/fatal
	REF 1f5018b84b24623eec7a519116532fee8e40e84b
  SHA512 c199eebe80ab51efce64f96410b3edf88f687c8c910ed57412ace7c5a6f137ba35ae5253381eddadc1039ab933d8032e0bc4da66c2fdabc99ef097a39c9197b9
	HEAD_REF develop
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
