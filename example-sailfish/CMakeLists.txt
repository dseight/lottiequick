include(GNUInstallDirs)
find_package(PkgConfig REQUIRED)

pkg_check_modules(SAILFISHAPP REQUIRED sailfishapp)

add_executable(org.example.lottiequick src/main.cpp)

set_property(TARGET org.example.lottiequick
        PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)

target_include_directories(org.example.lottiequick
        PRIVATE ../lib ${SAILFISHAPP_INCLUDE_DIRS})
target_compile_options(org.example.lottiequick
        PRIVATE ${SAILFISHAPP_CFLAGS})
target_link_libraries(org.example.lottiequick
        PRIVATE Qt5::Quick Qt5::Qml Qt5::Gui LottieQuick ${SAILFISHAPP_LDFLAGS})

install(TARGETS org.example.lottiequick
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

install(DIRECTORY qml/
        DESTINATION ${CMAKE_INSTALL_DATADIR}/org.example.lottiequick/qml
        FILES_MATCHING
        PATTERN "*.qml")

install(DIRECTORY ../example-animations/
        DESTINATION ${CMAKE_INSTALL_DATADIR}/org.example.lottiequick/qml/pages/animations
        FILES_MATCHING
        PATTERN "*.tgs")

install(FILES org.example.lottiequick.desktop
        DESTINATION ${CMAKE_INSTALL_DATADIR}/applications)

foreach (size 86x86 108x108 128x128 172x172)
    install(FILES icons/${size}/org.example.lottiequick.png
            DESTINATION ${CMAKE_INSTALL_DATADIR}/icons/hicolor/${size}/apps)
endforeach ()
