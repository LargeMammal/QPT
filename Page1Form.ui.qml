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

        TextArea {
            id: textArea
            text: qsTr("Text Area")
            Layout.fillHeight: true
            Layout.fillWidth: true
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

        TextField {
            id: textField1
            y: 0
            text: qsTr("Text Field")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: true
            transformOrigin: Item.Center
            Layout.columnSpan: 1
            Layout.rowSpan: 1
        }

        TextField {
            id: textField2
            text: qsTr("Text Field")
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        ToolBar {
            id: toolBar
            width: 360
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true

            TabButton {
                id: tabButton
                text: qsTr("Tab Button")
                anchors.fill: parent
            }
        }

    }

}
