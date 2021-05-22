#include <lottieanimation.h>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QElapsedTimer>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
    QGuiApplication app(argc, argv);

    qmlRegisterType<LottieQuick::LottieAnimation>("LottieQuick", 1, 0, "LottieAnimation");

    QQmlApplicationEngine engine(QUrl("main.qml"));

    QObject *topLevel = engine.rootObjects().value(0);
    auto *window = qobject_cast<QQuickWindow *>(topLevel);

    int totalDuration = 0;
    int loops = 0;
    QElapsedTimer timer;
    timer.start();

    QObject::connect(window, &QQuickWindow::beforeRendering, [&](){
        totalDuration += timer.elapsed();
        ++loops;

        // Show average FPS each 5 seconds
        if (totalDuration > 5 * 1000) {
            qDebug() << (1000.0 * loops) / totalDuration << "fps";
            totalDuration = 0;
            loops = 0;
        }
        timer.restart();
    });

    return app.exec();
}
