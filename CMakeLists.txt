cmake_minimum_required(VERSION 3.13)

project(LottieQuick LANGUAGES CXX VERSION 0.1.0)

find_package(Qt5 5.6 COMPONENTS Quick Qml Gui REQUIRED)
find_package(ZLIB REQUIRED)

option(BUILD_LOTTIE_QUICK_EXAMPLE "Build example application" OFF)
option(BUILD_LOTTIE_QUICK_SAILFISH_EXAMPLE "Build Sailfish OS example application" OFF)

add_subdirectory(lib)

if (BUILD_LOTTIE_QUICK_EXAMPLE)
    add_subdirectory(example)
endif ()

if (BUILD_LOTTIE_QUICK_SAILFISH_EXAMPLE)
    add_subdirectory(example-sailfish)
endif ()
