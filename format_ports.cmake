#!/usr/bin/env -S cmake -P

set(ports_dir "${CMAKE_CURRENT_LIST_DIR}/ports")

execute_process(
  COMMAND
    vcpkg
      format-manifest
      --x-builtin-ports-root=${ports_dir}
      --all
  RESULT_VARIABLE
    failure
)

if(failure)
  message(FATAL_ERROR "Failed to format ports/")
endif()
