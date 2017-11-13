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
        id: columnLayout
        anchors.bottom: parent.bottom
        anchors.top: progressBar.bottom
        anchors.right: parent.right
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
                    var outText = "";
                    main_text.text = "";
                    var jsonData = scanner.networkInfo();
                    for(var i = 0; i < jsonData.length; i++)
                    {
                        if(jsonData[i].ExternalAddress != null)
                        {
                            outText += "External address: "+jsonData[i].ExternalAddress
                                    +"\n======================\n";
                            continue;
                        }

                        outText += "Address: "+jsonData[i].Address
                                +"\nNetmask: "+jsonData[i].Netmask
                                +"\nNetwork: "+jsonData[i].Network+"/"+jsonData[i].NetworkSize
                                +"\nBroadcast: "+jsonData[i].Broadcast
                                +"\nHostMin: "+jsonData[i].HostMin
                                +"\nHostMax: "+jsonData[i].HostMax
                                +"\nMaxHostCount: "+jsonData[i].MaxHostCount
                                +"\n======================\n";
                    }
                    main_text.text += outText;
                }
            }
        }

    }
}
