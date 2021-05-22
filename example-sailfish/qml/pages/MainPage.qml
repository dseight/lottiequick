import QtQuick 2.6
import Sailfish.Silica 1.0
import LottieQuick 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: parent.width

            PageHeader {
                title: "Lottie Example"
            }

            LottieAnimation {
                id: animation
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 2 * Theme.horizontalPageMargin
                height: parent.width - 2 * Theme.horizontalPageMargin
                source: animationsModel.get(combo.currentIndex).path
                loops: LottieAnimation.Infinite
                autoPlay: autoPlaySwitch.checked
                direction: reverseSwitch.checked ? LottieAnimation.Reverse
                                                 : LottieAnimation.Forward

                frameScale: 0.5
            }

            ComboBox {
                id: combo
                width: parent.width
                label: "Animation"

                menu: ContextMenu {
                    Repeater {
                        model: animationsModel

                        MenuItem {
                            text: model.text
                        }
                    }
                }
            }

            TextSwitch {
                id: autoPlaySwitch
                text: "Auto Play"
                checked: true
            }

            TextSwitch {
                id: reverseSwitch
                text: "Reverse"
            }

            ButtonLayout {
                width: parent.width
                height: implicitHeight + Theme.paddingLarge
                Button {
                    text: "Start"
                    onClicked: animation.start()
                }
                Button {
                    text: "Play"
                    onClicked: animation.play()
                }
                Button {
                    text: "Pause"
                    onClicked: animation.pause()
                }
                Button {
                    text: "Toggle Pause"
                    onClicked: animation.togglePause()
                }
            }
        }

        VerticalScrollDecorator {}
    }

    ListModel {
        id: animationsModel

        ListElement {
            text: "Police Car"
            path: "animations/PoliceCar.tgs"
        }
        ListElement {
            text: "Compass"
            path: "animations/Compass.tgs"
        }
        ListElement {
            text: "Dice"
            path: "animations/Dice_Rolling.tgs"
        }
    }
}
