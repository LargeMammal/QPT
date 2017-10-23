//import related modules
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Item {
    Rectangle {
        id: rectangle
        anchors.fill: parent
        Layout.fillHeight: true
        Layout.fillWidth: true

        Text {
            id: ping_text
            text: qsTr("")
            padding: 4
            wrapMode: Text.WordWrap
            anchors.fill: parent
        }

        Button {
            id: button2
            text: qsTr("Ping")
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            onClicked: {
                var ipAddr = pingInput.text;
                var result = ipAddr+" is"+(scanner.ping(ipAddr)?" online":" offline");
                ping_text.text += result+"\n";
            }
        }

        TextInput {
            id: pingInput
            x: 280
            y: 36
            width: 80
            height: 20
            text: qsTr("0.0.0.0")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: button2.top
            anchors.bottomMargin: 10
            font.pixelSize: 12
        }
    }
}
