import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: id_AppWin
    visible: true
    width: 480
    height: 800
    title: qsTr("=adn pwd=")
    color: "#242C42"
    property color globalFontColor: "#C5C5C9"

    SwipeView {
        id: id_SwipeView
        anchors.fill: parent
        ViewKeyList{
            id: id_keyListObject
            onSgnChangeState: {
                id_dataFormObject.state = theNewState
                id_SwipeView.currentIndex = 1
            }
        }
        ViewData{
            id: id_dataFormObject
        }
    }

    PageIndicator {
        id: indicator
        count: id_SwipeView.count
        currentIndex: id_SwipeView.currentIndex
        anchors.bottom: id_SwipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
