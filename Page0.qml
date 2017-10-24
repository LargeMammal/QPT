//import related modules
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Item {
    id: item1

    Button {
        id: button
        text: qsTr("Scan IPs")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        onClicked: {
            var t = parseFloat(timeout.text);
            if(isNaN(t) || typeof(t) != "number" || t == null)
                t = 100;
            var d = parseFloat(maxDeadIPs.text);
            if(isNaN(d) || typeof(d) != "number" || d == null)
                d = 30;
            //console.log("("+timeout.text+", "+maxDeadIPs.text+")=>("+t+", "+d+")");
            main_text.text += scanner.getAddresses(function(x){
                main_text.text += x;
            }, t, d);
        }
    }

    Text {
        id: main_text
        text: qsTr("")
        anchors.bottom: timeout.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottomMargin: 0
        padding: 4
        wrapMode: Text.WordWrap
    }

    TextField {
        id: timeout
        y: 400
        text: qsTr("timeout ms (100)")
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: button.top
        anchors.bottomMargin: 0
    }

    TextField {
        id: maxDeadIPs
        y: 400
        text: qsTr("max consecutive dead IPs (30)")
        horizontalAlignment: Text.AlignHCenter
        anchors.left: timeout.right
        anchors.leftMargin: 0
        anchors.bottom: button.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }
}
