import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: idform_keyList
    width: 480
    height: 800
    signal sgnChangeState(string theNewState)

    Component {
        id: id_DelegateKeys
        Rectangle{
            height: 100
            width: 250
            border.color: "black"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    sgnChangeState("stView")
                    idPwdHandler.requestDataOfIndex(index)
                }
            }

            Text {
                text: modelData
                //                font.pixelSize: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    ListView{
        id: idListViewKeys
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        anchors.leftMargin: 20
        anchors.topMargin: 20
        anchors.fill: parent
        model: keysModel
        delegate: id_DelegateKeys
        onCurrentItemChanged:{
            //            console.log("Fromlistview " + idListViewKeys.currentIndex)
        }
        ScrollBar.vertical: ScrollBar {
            active: true
        }
    }

    Button {
        id: idbtn_Add
        x: 300
        y: 700
        text: qsTr("Add pwd")
        onClicked: {
            sgnChangeState("stAdd")
            id_SwipeView.currentIndex = 1
        }
    }
}
