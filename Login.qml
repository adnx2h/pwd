import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

Item {
    id: id_loginForm
    state: "stLogin"
    GroupBox{
        id: id_loginListBox
        anchors.fill: parent
        anchors.margins: 12
        anchors.bottomMargin: 20

        label: Label{
            id: id_title
            color: globalFontColor
            font.pixelSize: 20
        }

        ColumnLayout {
            id: id_loginLayout
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            DataField {
                id: id_txtPwd
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: false
                Layout.preferredWidth: id_loginLayout.width *.4
                echoMode: TextField.Password
                font.pixelSize: 10
            }
            RoundButton {
                id: id_btnLogin
                Layout.fillWidth: false
                Layout.preferredWidth: parent.width *.3
                Text {
                    text: qsTr("Verify")
                    color: globalFontColor
                    font.pixelSize: 15
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                radius: 5
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                palette {button: "#2A4B8D"}
                ColorAnimation {
                    from: "#4B62C1"
                    to: "#2A4B8D"
                    duration: 200
                }
                onClicked: {
                    id_pwdHandler.verifyPWD(id_txtPwd.text)
                }
            }
            Item { Layout.fillHeight: true; Layout.preferredHeight: parent.height * 0.5}
            Label{
                id: id_lblChangePwd
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: "change pwd"
                color: globalFontColor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        id_loginForm.state = "stChangePwd"
                        console.log("change Pwd")
                    }
                }
            }
        }

        ColumnLayout{
            id: id_changePwdLayout
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            GridLayout {
                columns: 2
                Layout.alignment: Qt.AlignCenter
                Label { text: "Old pwd"; color: globalFontColor; font.bold: true; Layout.preferredWidth: parent.width * .3 }
                DataField {
                    id: id_txtOldPwd
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                    Layout.preferredWidth: id_changePwdLayout.width *.5
                    echoMode: TextField.Password
                    font.pixelSize: 10
                }
                Label { text: "New pwd"; color: globalFontColor; font.bold: true }
                DataField {
                    id: id_txtNewPwd
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                    Layout.preferredWidth: id_changePwdLayout.width *.5
                    echoMode: TextField.Password
                    font.pixelSize: 10
                }
                Label { text: "Repeat new pwd"; color: globalFontColor; font.bold: true }
                DataField {
                    id: id_txtRepeatPwd
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                    Layout.preferredWidth: id_changePwdLayout.width *.5
                    echoMode: TextField.Password
                    font.pixelSize: 10
                }
            }
            RoundButton {
                id: id_btnChangePwd
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width *.3
                radius: 5
                palette {button: "#2A4B8D"}
                Text {
                    text: qsTr("Change Pwd")
                    color: globalFontColor
                    font.pixelSize: 15
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                ColorAnimation {
                    from: "#4B62C1"
                    to: "#2A4B8D"
                    duration: 200
                }
                onClicked: {
                    id_pwdHandler.changePwd(id_txtOldPwd.text, id_txtNewPwd.text, id_txtRepeatPwd.text)
                    id_loginForm.state = "stLogin"
                }
            }
        }
    }
    states:[
        State{
            name: "stLogin"
            PropertyChanges { target:id_loginLayout; visible: true}
            PropertyChanges { target:id_title; text: "Enter your password" }
            PropertyChanges { target:id_changePwdLayout; visible: false}
        },
        State {
            name: "stChangePwd"
            PropertyChanges { target:id_changePwdLayout; visible: true}
            PropertyChanges { target:id_loginLayout; visible: false}
            PropertyChanges { target:id_title; text: "Set new password" }
        }
    ]
}
