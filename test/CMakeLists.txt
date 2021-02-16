# Variables
SET(BINARY ${CMAKE_PROJECT_NAME}_test)

project(${BINARY})

# Create executable
add_executable(${BINARY} test_GameObject.cpp)

# Add google test library
add_subdirectory(lib/googletest)
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

# Add link libraries
target_link_libraries(${BINARY} common)
target_link_libraries(${BINARY} gtest gtest_main)