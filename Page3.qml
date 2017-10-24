//import related modules
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Item {
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
        anchors.topMargin: 0
        anchors.top: progressBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                id: third_text
                text: qsTr("")
                padding: 4
                wrapMode: Text.WordWrap
                anchors.fill: parent
            }
        }
        ToolBar {
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true

            ToolButton {
                text: qsTr("Exit")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: 0
                onClicked: Qt.quit()
            }
            ToolButton {
                id: button
                text: qsTr("Test site")
                property string property0: "none.none"
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                onClicked: {
                    third_text.text += scanner.getAddresses()+"\n";
                }
            }
        }
    }
}
