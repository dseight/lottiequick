# Expose INTERFACE_LINK_LIBRARIES property
cmake_policy(SET CMP0022 NEW)

include(GNUInstallDirs)

# Change BUILD_SHARED_LIBS only for rlottie
set(BUILD_SHARED_LIBS_SAVED ${BUILD_SHARED_LIBS})

set(LOTTIE_MODULE OFF)
set(LOTTIE_THREAD OFF)
set(BUILD_SHARED_LIBS OFF)
add_subdirectory(rlottie EXCLUDE_FROM_ALL)
target_compile_options(rlottie PRIVATE -fPIC)

set(BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS_SAVED})

# Don't use '-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/rlottie.expmap',
# as it prevents main() symbol export and breaks booster behavior in example.
get_target_property(rlottie_link_libraries rlottie INTERFACE_LINK_LIBRARIES)
list(FILTER rlottie_link_libraries
        EXCLUDE REGEX "-Wl,--version-script=.+/rlottie\.expmap")
set_target_properties(rlottie PROPERTIES
        INTERFACE_LINK_LIBRARIES "${rlottie_link_libraries}")

add_library(LottieQuick
        lottieanimation.cpp
        lottierenderthread.cpp)

set_target_properties(LottieQuick PROPERTIES
        AUTOMOC ON
        CXX_STANDARD 11
        CXX_STANDARD_REQUIRED ON
        CXX_VISIBILITY_PRESET hidden
        VISIBILITY_INLINES_HIDDEN ON
        DEFINE_SYMBOL LOTTIE_QUICK_BUILD_LIBRARY
        PUBLIC_HEADER "lottieanimation.h;lottiequickglobal.h"
        LIBRARY_OUTPUT_NAME lottiequick
        VERSION ${PROJECT_VERSION}
        SOVERSION 0)

target_include_directories(LottieQuick PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/lottiequick>)

target_link_libraries(LottieQuick PUBLIC Qt5::Quick PRIVATE rlottie)

if (LOTTIE_QUICK_WITH_ZLIB)
    target_link_libraries(LottieQuick PRIVATE ZLIB::ZLIB)
    target_compile_definitions(LottieQuick PRIVATE WITH_ZLIB)
endif ()

# Generate pkg-config file

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/lottiequick.pc.in
        ${CMAKE_CURRENT_BINARY_DIR}/lottiequick.pc @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/lottiequick.pc
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)

# Generate CMake configuration files

include(CMakePackageConfigHelpers)

install(TARGETS LottieQuick
        EXPORT LottieQuickTargets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/lottiequick)

install(EXPORT LottieQuickTargets
        FILE LottieQuickTargets.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/LottieQuick)

configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/LottieQuickConfig.cmake.in
        "${CMAKE_CURRENT_BINARY_DIR}/LottieQuickConfig.cmake"
        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/LottieQuick)

write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/LottieQuickConfigVersion.cmake"
        COMPATIBILITY SameMajorVersion)

install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/LottieQuickConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/LottieQuickConfigVersion.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/LottieQuick)
