#include <lottieanimation.h>
#include <sailfishapp.h>
#include <QGuiApplication>
#include <QtQuick>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    qmlRegisterType<LottieQuick::LottieAnimation>("LottieQuick", 1, 0, "LottieAnimation");

    view->setSource(SailfishApp::pathTo(QStringLiteral("qml/main.qml")));
    view->show();

    return app->exec();
}
