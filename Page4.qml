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

            ListView {
                id: listView
                anchors.fill: parent
                delegate: Item {
                    x: 5
                    width: 80
                    height: 40
                    Row {
                        id: row1

                        Text {
                            text: "Name: " + Name
                            id: name
                            //anchors.left: parent.left
                        }
                        Text {
                            text: " Type: " + Type
                            //anchors.left: name.right
                        }
                        spacing: 10
                    }
                }
                model: ListModel {
                    id:listModel
                }
            }
        }

        ToolBar {
            id: toolBar
            Layout.fillWidth: true

            ToolButton {
                text: qsTr("Exit")
                anchors.right: parent.right
                anchors.left: scan.right
                onClicked: Qt.quit()
            }

            ToolButton {
                id: scan
                text: qsTr("Scan")
                anchors.right: parent.horizontalCenter
                anchors.left: parent.left
                onClicked: {
                    var outText = "";
                    var jsonData = scanner.getConfigurations();

                    for(var i = 0; i < jsonData.length; i++)
                    {
                        listModel.append(jsonData[i]);
                    }
                }
            }
        }

    }
}
