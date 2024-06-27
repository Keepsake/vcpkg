vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/crypto
	REF 590b2603bd23dd0a72eb1546b58756038df722a5
  SHA512 2250c4894f7d99dc1cf26fbec7ceceb086e19ff9f903619a962b2d3021ff729db924e7519762e72573876a1bb128dc219567bfb82cd3251ac521432eafa2abd4
	HEAD_REF unstable
)

vcpkg_cmake_configure(
  SOURCE_PATH
    "${SOURCE_PATH}"
  OPTIONS
    -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME KsCrypto)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(
  INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)
