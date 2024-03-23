vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Keepsake/fatal
	REF 08519a92444838535b8e241fbb4d4bf5c33229f5
  SHA512 cf3bb871c88520ec62385f5cfeee98ad985086730446a9ea6c17d998ef684bf6195c93bafc364def0a0f965ff10351577fcedbd007bf7d629e5ea7ae7aafc6fd
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
