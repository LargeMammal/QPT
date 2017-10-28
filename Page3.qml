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
                id: scan_text
                text: qsTr("")
                padding: 4
                wrapMode: Text.WordWrap
                anchors.fill: parent
            }
        }
        Row {
            id: row
            height: 40
            Layout.fillWidth: true

            ComboBox {
                id: targetBox
                anchors.right: maskBox.left
                anchors.left: parent.left
                editable: true

                model: ListModel {
                    id: targetList
                }
                onAccepted: {
                    if (find(editText) === -1)
                        targetList.append({text: editText})
                }
                Component.onCompleted: {
                    var jsonData = scanner.networkInfo();
                    for(var i = 0; i < jsonData.length; i++)
                    {
                        targetList.append({text: jsonData[i].Address})
                    }
                }
            }

            SpinBox {
                id: maskBox
                anchors.right: parent.right
                from: 0
                to: 30
                value: 30
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
                    var power = 32 - maskBox.value
                    var ipNum = Math.pow(2, power) - 2
                    scan_text.text = "Checking IPs ranging from " + targetBox.currentText + "-" + targetBox.currentText.substring(targetBox.currentText.length - 3)
                }
            }
        }

    }
}
