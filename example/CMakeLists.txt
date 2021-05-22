add_executable(lottiequick-example-desktop main.cpp)

target_link_libraries(lottiequick-example-desktop
        PRIVATE Qt5::Quick Qt5::Qml Qt5::Gui LottieQuick)
