# Findmujoco.cmake
# Try to find the mujoco package and define mujoco_INCLUDE_DIR and mujoco_LIBRARIES
find_path(mujoco_INCLUDE_DIRS mujoco.h
    PATHS
    ${mujoco_DIR}/include/mujoco
)

find_library(mujoco_LIBRARIES NAMES mujoco
  PATHS
  ${mujoco_DIR}/lib
)

# Check if the necessary paths were found
if (NOT mujoco_INCLUDE_DIRS)
  message(FATAL_ERROR "mujoco header (mujoco.h) not found.")
endif()

if (NOT mujoco_LIBRARIES)
  message(FATAL_ERROR "mujoco library (mujoco) not found.")
endif()

# Define the mujoco package as found
message(STATUS "Found mujoco.so path: at ${mujoco_LIBRARIES}")
message(STATUS "Found mujoco_include: at ${mujoco_INCLUDE_DIRS}")