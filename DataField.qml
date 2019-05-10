import QtQuick 2.4
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    property alias pr_defaultText: idtxt_text.placeholderText
    property alias pr_text: idtxt_text.text
    property alias pr_readOnly: idtxt_text.readOnly
    property alias pr_textColor: idtxt_text.color

    border.color: "black"
    border.width: 2
    width: 400; height: 50
    TextArea{
        id: idtxt_text
        readOnly: true
        anchors.fill: parent
        font.pointSize: 21
    }
}
