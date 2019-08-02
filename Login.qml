import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    id: id_loginForm
    state: "stLogin"
    property alias pr_loginPwdText: id_txtPwd.text
    property alias pr_changeloginPwdText: id_txtOldPwd.text
    property alias pr_newPwdText: id_txtNewPwd.text
    property alias pr_repeatPwdText: id_txtRepeatPwd.text
    property alias pr_popupAlert: id_popupLogin

    AlertInfo{
        id: id_popupLogin
        x: Math.round((parent.width) / 2) - (parent.width/8)
        y: Math.round((parent.height - height) / 2)

        width: parent.width/2
        height: parent.height/3
    }


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
                Layout.preferredWidth: id_loginLayout.width *.5
                echoMode: TextField.Password
                font.pixelSize: 15
                horizontalAlignment: TextField.AlignHCenter
                background: Rectangle{color: "#242C42"}
                placeholderText: "Password"
            }
            Rectangle{
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth: id_loginLayout.width *.5
                height: 1
            }
            Item { Layout.fillHeight: true; height: parent.height * 0.1}

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
//                    id_popup.open()
                    id_pwdHandler.verifyPWD(id_txtPwd.text)
                }


            }
            Item { Layout.fillHeight: true; height: parent.height * 0.5}
            Label{
                id: id_lblChangePwd
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: "change pwd"
                font.pixelSize: 15
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
            ColumnLayout {
                spacing: 5
                Layout.alignment: Qt.AlignCenter
                DataField {
                    id: id_txtOldPwd
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                    Layout.preferredWidth: id_changePwdLayout.width *.5
                    echoMode: TextField.Password
                    font.pixelSize: 15
                    horizontalAlignment: TextField.AlignHCenter
                    background: Rectangle{color: "#242C42"}
                    placeholderText: "Current Password"
                }
                Rectangle{
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: id_loginLayout.width *.5
                    height: 1
                }
                Item { Layout.fillHeight: true; height: parent.height * 0.1}
                DataField {
                    id: id_txtNewPwd
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                    Layout.preferredWidth: id_changePwdLayout.width *.5
                    echoMode: TextField.Password
                    font.pixelSize: 15
                    horizontalAlignment: TextField.AlignHCenter
                    background: Rectangle{color: "#242C42"}
                    placeholderText: "New Password"
                }
                Rectangle{
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: id_loginLayout.width *.5
                    height: 1
                }
                Item { Layout.fillHeight: true; height: parent.height * 0.1}
                DataField {
                    id: id_txtRepeatPwd
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                    Layout.preferredWidth: id_changePwdLayout.width *.5
                    echoMode: TextField.Password
                    font.pixelSize: 15
                    horizontalAlignment: TextField.AlignHCenter
                    background: Rectangle{color: "#242C42"}
                    placeholderText: "Repeat Password"
                }
                Rectangle{
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: id_loginLayout.width *.5
                    height: 1
                }
                Item { Layout.fillHeight: true; height: parent.height * 0.1}
            }
            Item { Layout.fillHeight: true; height: parent.height * 0.1}
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
