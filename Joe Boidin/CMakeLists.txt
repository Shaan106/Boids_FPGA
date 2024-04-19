# Specify the minimum version for CMake - CMakeLists.txt
cmake_minimum_required(VERSION 3.10)

# Project's name
project(boiding)

# Set the C standard
set(CMAKE_C_STANDARD 99)

# Add executable to the project
add_executable(boidin strpped_BPU.c)