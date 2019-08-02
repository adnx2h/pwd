import QtQuick 2.0
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.0
import QtQuick.Layouts 1.12

Popup {
    id: id_popup
    property alias pr_popupTitle: id_txtTitle.text
    property alias pr_popupMessage: id_txtMessage.text

    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    padding: 0

    Rectangle {
        id: id_PopupRectangle;
        color: "#242C42";
        radius: 10
        border.color: globalFontColor
        width: parent.width/2
        height: parent.height/2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Column{
            Rectangle{
                id: rec
                color: "#171E32"
                radius: 10
                border.color: globalFontColor
                width: id_PopupRectangle.width
                height: id_PopupRectangle.height/5
                Text {
                    id: id_txtTitle
                  //  text: qsTr("Alert")
                    font.pixelSize: 20
                    color: globalFontColor
                    anchors.centerIn: parent
                }
            }
            Text{
                id: id_txtMessage
                font.pixelSize: 15
                color: globalFontColor
                //text: qsTr("\n      Incorrect \n      Password")
            }
        }
    }

    background: DropShadow {
        source: id_popup.contentItem

        horizontalOffset: 0
        verticalOffset: 5
        radius: 10
        samples: 7
        color: "black"
    }
}
