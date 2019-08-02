import QtQuick 2.7
import QtQuick.Controls 2.12
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
        id: id_swipeView
        anchors.fill: parent
        interactive: false
        onCurrentIndexChanged:{
            if(id_swipeView.currentIndex == 2)
                id_swipeView.interactive = true
            else
                id_swipeView.interactive = false
        }
        Login{
            id: id_login
        }
        ViewKeyList{
            id: id_keyListObject
            onSgnChangeState: {
                id_dataFormObject.state = theNewState
                id_swipeView.currentIndex = 2
            }
        }
        ViewData{
            id: id_dataFormObject
        }
    }
    PageIndicator {
        id: indicator
        count: id_swipeView.count
        currentIndex: id_swipeView.currentIndex
        anchors.bottom: id_swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Connections{
        target: id_pwdHandler
        onSgn_pwdIsOk:{
            console.log("pwd Ok")
            id_swipeView.currentIndex = 1;
        }
        onSgn_pwdNotOk:{
            console.log(popupTitle +" " + popupMsg + " pwd Not ok")
            id_login.pr_loginPwdText = ""
            id_login.pr_changeloginPwdText = ""
            id_login.pr_newPwdText = ""
            id_login.pr_repeatPwdText = ""
            id_login.pr_popupAlert.open()
            id_login.pr_popupAlert.pr_popupTitle = popupTitle
            id_login.pr_popupAlert.pr_popupMessage = popupMsg
        }
    }
}
