import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import LottieQuick 1.0

ApplicationWindow {
    id: root

    width: 800
    height: 600
    visible: true

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Item {
            height: parent.height
            Layout.minimumWidth: 200

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                ComboBox {
                    id: combo
                    width: parent.width
                    model: animationsModel
                }

                Label {
                    text: "Grid size: " + slider.value
                }

                Slider {
                    id: slider
                    width: parent.width
                    minimumValue: 1
                    maximumValue: 6
                    value: 2
                    stepSize: 1
                }

                CheckBox {
                    id: reverseCheckbox
                    text: "Reverse"
                    checked: false
                }

                Button {
                    id: startButton
                    text: "Start"
                }

                Button {
                    id: playButton
                    text: "Play"
                }

                Button {
                    id: pauseButton
                    text: "Pause"
                }
            }
        }

        Grid {
            id: grid
            height: parent.height
            columns: slider.value
            rows: slider.value

            Repeater {
                model: grid.columns * grid.rows
                LottieAnimation {
                    width: grid.width / grid.columns
                    height: grid.height / grid.rows
                    source: animationsModel.get(combo.currentIndex).path
                    loops: LottieAnimation.Infinite
                    direction: reverseCheckbox.checked ? LottieAnimation.Reverse
                                                       : LottieAnimation.Forward

                    Connections {
                        target: startButton
                        onClicked: start()
                    }
                    Connections {
                        target: playButton
                        onClicked: play()
                    }
                    Connections {
                        target: pauseButton
                        onClicked: pause()
                    }
                }
            }
        }
    }

    ListModel {
        id: animationsModel

        ListElement {
            text: "Police Car"
            path: "../example-animations/PoliceCar.tgs"
        }
        ListElement {
            text: "Compass"
            path: "../example-animations/Compass.tgs"
        }
        ListElement {
            text: "Dice"
            path: "../example-animations/Dice_Rolling.tgs"
        }
    }
}
