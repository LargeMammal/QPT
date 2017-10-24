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
    id:window
    visible: true

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page0 {
        }

        Page1 {
        }

        Page2 {
        }

        Page3 {}
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
        TabButton {
            text: qsTr("Third")
        }
        TabButton {
            text: qsTr("Fourth")
        }
    }
}
