#!/usr/bin/env -S cmake -P

set(ports_root "${CMAKE_CURRENT_LIST_DIR}/ports")
set(versions_dir "${CMAKE_CURRENT_LIST_DIR}/versions")

execute_process(
  COMMAND
    vcpkg
      x-add-version
      --x-builtin-ports-root=${ports_root}
      --x-builtin-registry-versions-dir=${versions_dir}
      --all
      --overwrite-version
  RESULT_VARIABLE
    failure
)

if(failure)
  message(FATAL_ERROR "Failed test update versions")
endif()
