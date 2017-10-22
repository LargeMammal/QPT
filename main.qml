//import related modules
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

//window containing the application
ApplicationWindow {
    //title of the application
    title: qsTr("Qt Penetration Tool")
    width: 640
    height: 480
    id:window
    visible: true

    ProgressBar {
        id: progressBar
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    // Content Area
    ColumnLayout {
        id: columnLayout
        anchors.topMargin: 0
        anchors.top: progressBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        Rectangle {
            id: rectangle
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                id: main_text
                text: qsTr("Hello World!")
                padding: 4
                wrapMode: Text.WordWrap
                anchors.fill: parent
            }
        }


        Row {
            id: row
            height: 40
            Layout.fillWidth: true
            anchors.bottom: toolBar.top

            function append(newElement) {
                comboBox.model.append({ name: newElement })
            }

            Connections {
                target: scanner
                onAddNewElement: append(newElement)
            }

            ComboBox {
                id: comboBox
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: spinBox.left
                anchors.rightMargin: 0

                model: ListModel {}
            }

            SpinBox {
                id: spinBox
                anchors.right: parent.right
                anchors.rightMargin: 0
            }

            Component.onCompleted: {
                //model.append({text: scanner.getAddresses()})
            }
        }

        ToolBar {
            id: toolBar
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true

            ToolButton {
                y: 0
                text: qsTr("Exit")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: 0
                onClicked: Qt.quit()
            }
            ToolButton {
                id: button
                y: 0
                text: qsTr("Click me!")
                property string property0: "none.none"
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                onClicked: {
                    //rectangle.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                    //main_text.text = scanner.getAddresses()
                    //model.append({text: scanner.getAddresses()})
                    scanner.getAddresses()
                }
            }
        }


    }
}
