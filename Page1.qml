//import related modules
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Item {
    // Content Area
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Rectangle {
            id: rectangle
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                id: model
                text: qsTr("Hello World!")
                padding: 10
                anchors.fill: parent
                font.pixelSize: 12
            }

            Button {
                id: button1
                text: qsTr("Button")
                anchors.centerIn: parent
                onClicked: {
                    model.text = scanner.ping(textInput.text)
                    //model.append({text: scanner.ping(textInput.text)})
                }
            }


            TextInput {
                id: textInput
                text: qsTr("0.0.0.0")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: button1.top
                anchors.bottomMargin: 10
                font.pixelSize: 12
            }

        }
    }
}
