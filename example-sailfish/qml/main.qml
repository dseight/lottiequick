import QtQuick 2.3
import Sailfish.Silica 1.0

ApplicationWindow {
    initialPage: Qt.resolvedUrl("pages/MainPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
