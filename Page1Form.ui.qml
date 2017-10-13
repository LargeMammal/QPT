import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    x: 0
    width: 640
    height: 480
    property alias item1: item1
    scale: 1

    ProgressBar {
        id: progressBar
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        value: 0.5
    }

    ColumnLayout {
        id: columnLayout
        anchors.topMargin: 0
        spacing: 2
        anchors.top: progressBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: "#ffffff"
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                id: text1
                text: qsTr("Text")
                padding: 4
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 12
            }
        }

        TextField {
            id: textField
            text: qsTr("Text Field")
            Layout.fillHeight: false
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.fillWidth: true
            Layout.preferredWidth: -1
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }



        ToolBar {
            id: toolBar
            width: 360
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true

            Button {
                id: button
                text: qsTr("Button")
                anchors.right: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.rightMargin: 0
            }

            ToolButton {
                id: toolButton
                text: qsTr("Tool Button")
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.left: button.right
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.leftMargin: 0
            }
        }


    }

}
