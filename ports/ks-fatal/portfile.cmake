vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/fatal
	REF ebca43a9b2347f84ef44987f8a9ce0cb88d6bd6b
  SHA512 f8c1825b6b8a7b08132881946cf4db0f8c3001428b15c6daf90a3ededeba4870f1aebe7cadb2ace38334c74fcb7d2523a2b3a5ff1ac401b09ad68133f846569c
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
