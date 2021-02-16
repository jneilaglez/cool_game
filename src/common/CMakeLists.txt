# Variables
set(LIB_SOURCES
        Game.cpp
        GameObject.cpp
        ../../include/Game.h
        ../../include/GameObject.h)

# Load library
add_library(common ${LIB_SOURCES})