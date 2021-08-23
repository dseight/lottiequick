cmake_minimum_required(VERSION 3.13)

project(LottieQuick LANGUAGES CXX VERSION 0.1.0)

option(LOTTIE_QUICK_WITH_ZLIB "Build with zlib to support gzipped Lottie files (TGS)" ON)
option(LOTTIE_QUICK_BUILD_EXAMPLE "Build example application" OFF)
option(LOTTIE_QUICK_BUILD_SAILFISH_EXAMPLE "Build Sailfish OS example application" OFF)

find_package(Qt5 5.6 COMPONENTS Quick Qml Gui REQUIRED)

if (LOTTIE_QUICK_WITH_ZLIB)
    find_package(ZLIB REQUIRED)
endif ()

add_subdirectory(lib)

if (LOTTIE_QUICK_BUILD_EXAMPLE)
    add_subdirectory(example)
endif ()

if (LOTTIE_QUICK_BUILD_SAILFISH_EXAMPLE)
    add_subdirectory(example-sailfish)
endif ()
