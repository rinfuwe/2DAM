# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appejercicio_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appejercicio_autogen.dir\\ParseCache.txt"
  "appejercicio_autogen"
  )
endif()
