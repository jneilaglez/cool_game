# Variables
SET(BINARY ${CMAKE_PROJECT_NAME})

# Create executable
add_executable(${BINARY} main.cpp)

# Add folder libraries and link
add_subdirectory(common)
target_link_libraries(${BINARY} PUBLIC common)
