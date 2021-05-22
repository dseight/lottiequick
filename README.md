# LottieQuick

## About

`LottieQuick` is a Qt 5.6-compatible library for displaying Lottie animations in Qt Quick.

It is using the [rlottie](https://github.com/Samsung/rlottie) library as a rendering backend.

## Usage

Register `LottieAnimation` component in your Qt Quick application:

```cpp
qmlRegisterType<LottieQuick::LottieAnimation>("LottieQuick", 1, 0, "LottieAnimation");
```

then just import `LottieQuick 1.0` in QML and you are ready to use Lottie:

```qml
LottieAnimation {
    source: "animation.json"
}
```

## License

LottieQuick is provided under the [LGPLv2.1 license](LICENSE).
