include(GNUInstallDirs)
find_package(PkgConfig REQUIRED)

pkg_check_modules(SAILFISHAPP REQUIRED sailfishapp)

add_executable(lottiequick-example src/main.cpp)

set_property(TARGET lottiequick-example
        PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)

target_include_directories(lottiequick-example
        PRIVATE ../lib ${SAILFISHAPP_INCLUDE_DIRS})
target_compile_options(lottiequick-example
        PRIVATE ${SAILFISHAPP_CFLAGS})
target_link_libraries(lottiequick-example
        PRIVATE Qt5::Quick Qt5::Qml Qt5::Gui LottieQuick ${SAILFISHAPP_LDFLAGS})

install(TARGETS lottiequick-example
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

install(DIRECTORY qml/
        DESTINATION ${CMAKE_INSTALL_DATADIR}/lottiequick-example/qml
        FILES_MATCHING
        PATTERN "*.qml")

install(DIRECTORY ../example-animations/
        DESTINATION ${CMAKE_INSTALL_DATADIR}/lottiequick-example/qml/pages/animations
        FILES_MATCHING
        PATTERN "*.tgs")

install(FILES lottiequick-example.desktop
        DESTINATION ${CMAKE_INSTALL_DATADIR}/applications)

foreach (size 86x86 108x108 128x128 172x172)
    install(FILES icons/${size}/lottiequick-example.png
            DESTINATION ${CMAKE_INSTALL_DATADIR}/icons/hicolor/${size}/apps)
endforeach ()
