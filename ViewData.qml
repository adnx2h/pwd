import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Layouts 1.0

Item {
    id: id_DataForm
    width: 480; height: 800
    state: ""
    onStateChanged: console.log("==State changed to: "+ id_DataForm.state)
    GroupBox{
        id: id_viewDataBox
        title: "Account details"
        anchors.fill: parent
        anchors.margins: 12
        anchors.bottomMargin: 20

        label: Label{
            text: "Account details"
            color: globalFontColor
            font.pixelSize: 20
        }

        ColumnLayout {
            anchors.fill: parent

            DataField{
                id: id_keyTxt
            }
            DataField{
                id: id_userTxt
            }
            DataField{
                id: id_pwdTxt
            }
            DataField{
                id: id_siteTxt
            }
            DataField{
                id: id_notesTxt
                Layout.rowSpan: 5
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            RowLayout{
                RoundButton {
                    id: id_btnSave
                    Layout.fillWidth: true
                    visible: false
                    text: qsTr("Save")
                    radius: 5
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
                        idPwdHandler.saveEditedValues(id_keyTxt.text, id_userTxt.text, id_pwdTxt.text, id_siteTxt.text, id_notesTxt.text)
                        //            idPwdHandler.loadJsonFile()
                        id_SwipeView.currentIndex = 0
                    }
                }

                RoundButton {
                    id: id_btnDelete
                    Layout.fillWidth: true
                    visible: false
                    text: qsTr("Delete")
                    radius: 5
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
                        id_DataForm.state = "stDelete"
                    }
                }
                RoundButton {
                    id: id_btnConfirmDel
                    Layout.fillWidth: true
                    visible: false
                    text: qsTr("Confirm Delete")
                    radius: 5
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
                        idPwdHandler.deleteDataOfCurrentIndex()
                        id_SwipeView.currentIndex = 0
                    }
                }
                RoundButton {
                    id: id_btnCancel
                    Layout.fillWidth: true
                    visible: false
                    text: qsTr("Cancel")
                    radius: 5
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
                        id_SwipeView.currentIndex = 0
                        id_DataForm.state = "stAdd"
                    }
                }
                RoundButton {
                    id: id_btnEdit
                    Layout.fillWidth: true
                    visible: false
                    text: qsTr("Edit")
                    radius: 5
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
                        id_DataForm.state = "stEdit"
                        //            idPwdHandler.saveEditedValues(id_keyTxt.pr_text, id_userTxt.pr_text, id_pwdTxt.pr_text, id_siteTxt.pr_text, id_notesTxt.pr_text)
                    }
                }
            }
        }
    }

    Connections{
        target: idPwdHandler
        onSendPwdDetails:{
            id_keyTxt.text = key
            id_userTxt.text = user
            id_pwdTxt.text = pwd
            id_siteTxt.text = site
            id_notesTxt.text = notes
            //            id_DataForm.state = "stView"
        }
    }
    states:[
        State{
            name: "stAdd"
            PropertyChanges { target:id_keyTxt; placeholderText: "id"; readOnly: false; placeholderTextColor: "gray"; text: ""}
            PropertyChanges { target:id_userTxt; placeholderText: "User"; readOnly: false; placeholderTextColor: "gray"; text: ""}
            PropertyChanges { target:id_pwdTxt; placeholderText: "pwd"; readOnly: false; placeholderTextColor: "gray"; text: ""}
            PropertyChanges { target:id_siteTxt; placeholderText: "website"; readOnly: false; placeholderTextColor: "gray"; text: ""}
            PropertyChanges { target:id_notesTxt; placeholderText: "notes..."; readOnly: false; placeholderTextColor: "gray"; text: ""}

            PropertyChanges { target:id_btnCancel; visible: true}
            PropertyChanges { target:id_btnSave; visible: true}
            PropertyChanges { target:id_btnDelete; visible: false}
            PropertyChanges { target:id_btnEdit; visible: false}
            PropertyChanges { target:id_btnConfirmDel; visible: false}
        },
        State{
            name: "stEdit"
            PropertyChanges { target:id_keyTxt; readOnly: false;}
            PropertyChanges { target:id_userTxt; readOnly: false;}
            PropertyChanges { target:id_pwdTxt; readOnly: false;}
            PropertyChanges { target:id_siteTxt; readOnly: false;}
            PropertyChanges { target:id_notesTxt; readOnly: false;}

            PropertyChanges { target:id_btnCancel;  visible: true}
            PropertyChanges { target:id_btnSave;  visible: true}
            PropertyChanges { target:id_btnDelete;  visible: false}
            PropertyChanges { target:id_btnEdit;  visible: false}
        },
        State{
            name: "stView"
            PropertyChanges { target:id_keyTxt; readOnly: true}
            PropertyChanges { target:id_userTxt; readOnly: true}
            PropertyChanges { target:id_pwdTxt; readOnly: true}
            PropertyChanges { target:id_siteTxt; readOnly: true}
            PropertyChanges { target:id_notesTxt; readOnly: true}

            PropertyChanges { target:id_btnEdit; visible: true}
            PropertyChanges { target:id_btnDelete; visible: true}
            PropertyChanges { target:id_btnSave; visible: false}
            PropertyChanges { target:id_btnCancel; visible: false}
        },
        State{
            name: "stDelete"
            PropertyChanges { target:id_keyTxt;}
            PropertyChanges { target:id_userTxt;}
            PropertyChanges { target:id_pwdTxt;}
            PropertyChanges { target:id_siteTxt;}
            PropertyChanges { target:id_notesTxt;}

            PropertyChanges { target:id_btnConfirmDel; visible: true}
            PropertyChanges { target:id_btnCancel; visible: true}
            PropertyChanges { target:id_btnSave; visible: false}
            PropertyChanges { target:id_btnDelete; visible: false}
            PropertyChanges { target:id_btnEdit; visible: false}
        }
    ]
}
