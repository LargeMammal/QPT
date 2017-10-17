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

        TextField {
            id: textIP
            text: qsTr("We might need to use this for IP")
            Layout.fillHeight: false
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.fillWidth: true
            Layout.preferredWidth: -1
        }

        ToolBar {
            id: toolBar
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
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                onClicked: {
                    rectangle.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                    main_text.text = "Hello";
                }
            }
        }
    }
}
