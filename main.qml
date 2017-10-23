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
    property alias main_text: main_text
    property alias textInput: textInput
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
                text: qsTr("")
                padding: 4
                wrapMode: Text.WordWrap
                anchors.fill: parent

                Button {
                    id: button1
                    x: 505
                    text: qsTr("Ping")
                    anchors.top: parent.top
                    anchors.topMargin: 26
                    anchors.right: parent.right
                    anchors.rightMargin: 35
                    onClicked: {
                        var ipAddr = textInput.text;
                        var result = ipAddr+" is"+(scanner.ping(ipAddr)?" online":" offline");
                        main_text.text += result+"\n";
                        model.append({text: result});
                    }
                }

                TextInput {
                    id: textInput
                    x: 347
                    y: 36
                    width: 80
                    height: 20
                    text: qsTr("0.0.0.0")
                    anchors.verticalCenter: button1.verticalCenter
                    anchors.right: button1.left
                    anchors.rightMargin: 20
                    font.pixelSize: 12
                }
            }
        }


        Row {
            id: row
            height: 40
            Layout.fillWidth: true
            anchors.bottom: toolBar.top

            ComboBox {
                id: comboBox
                property string text: "none.none"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: spinBox.left
                anchors.rightMargin: 0

                model: ListModel {
                    id: model
                }

                onActivated: {
                    scanner.setMyAddr(currentText)
                }
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
                text: qsTr("Network info")
                property string property0: "none.none"
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                onClicked: {
                    //rectangle.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                    //main_text.text = scanner.getAddresses()
                    main_text.text += scanner.getAddresses()+"\n";
                    model.append({text: scanner.getAddresses()});
                }
            }
        }


    }
}
