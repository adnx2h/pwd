import QtQuick 2.7
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0

Item {
    id: idform_keyList
    width: 480
    height: 800
    signal sgnChangeState(string theNewState)
    GroupBox{
        id: id_keyListBox
        anchors.fill: parent
        anchors.margins: 12
        anchors.bottomMargin: 20

        label: Label{
            text: "Choose an account to see details"
            color: globalFontColor
            font.pixelSize: 20
        }

        Component {
            id: id_DelegateKeys
            RowLayout{
                Rectangle{
                    height: 50
                    width: 250
                    border.color: "black"
                    color: index % 2 == 0 ? "#171E32" : "#111526"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            sgnChangeState("stView")
                            idPwdHandler.requestDataOfIndex(index)
                        }}
                    Text {
                        text: modelData
                        color: globalFontColor
                        font.pixelSize: 25
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }

        ListView{
            id: idListViewKeys
            anchors.fill: parent
            model: keysModel
            delegate: id_DelegateKeys
            clip: true
            onCurrentItemChanged:{
                //            console.log("Fromlistview " + idListViewKeys.currentIndex)
            }
            ScrollBar.vertical: ScrollBar {
                active: true
            }
        }

        RoundButton {
            id: id_add_del
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 60; height: 60
            text: qsTr("+")
            font.pixelSize: 50
            font.bold: true
            palette {
                button: "#2A4B8D"
            }
            ColorAnimation {
                from: "#4B62C1"
                to: "#2A4B8D"
                duration: 200
            }
            onClicked: {
                sgnChangeState("stAdd")
                id_SwipeView.currentIndex = 1
            }
        }
    }
}
