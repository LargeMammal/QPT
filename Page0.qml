//import related modules
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Item {
    id: item1

    Button {
        id: button
        text: qsTr("Button")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        onClicked: {
            main_text.text += scanner.getAddresses();
        }
    }

    Text {
        id: main_text
        text: qsTr("")
        anchors.bottom: button.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottomMargin: -40
        padding: 4
        wrapMode: Text.WordWrap
    }
}
