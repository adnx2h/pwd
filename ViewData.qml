import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: id_DataForm
    width: 480; height: 800
    state: ""
    onStateChanged: console.log("==State changed to: "+ id_DataForm.state)
    Column {
        x: 40
        y: 31
        spacing: 15
        DataField{
            id: id_keyTxt
            pr_readOnly: true
            pr_text: ""
        }
        DataField{
            id: id_userTxt
            focus: true
        }
        DataField{
            id: id_pwdTxt
        }
        DataField{
            id: id_siteTxt
        }
        DataField{
            id: id_notesTxt
            height: 300
        }
    }

    Button {
        id: id_btnSave
        x: 40; y: 663;
        width: 150; height: 60
        visible: false
        text: qsTr("Save")
        onClicked: {
            idPwdHandler.saveEditedValues(id_keyTxt.pr_text, id_userTxt.pr_text, id_pwdTxt.pr_text, id_siteTxt.pr_text, id_notesTxt.pr_text)
//            idPwdHandler.loadJsonFile()
            id_SwipeView.currentIndex = 0
        }
    }
    Button {
        id: id_btnDelete
        x: 290; y: 663;
        width: 150; height: 60
        visible: false
        text: qsTr("Delete")
        onClicked: {
            id_DataForm.state = "stDelete"
        }
    }
    Button {
        id: id_btnConfirmDel
        x: 40; y: 663
        width: 150; height: 60
        visible: false
        text: qsTr("Confirm Delete")
        onClicked: {
            idPwdHandler.deleteDataOfCurrentIndex()
            id_SwipeView.currentIndex = 0
        }
    }
    Button {
        id: id_btnCancel
        x: 290; y: 663;
        width: 150; height: 60
        visible: false
        text: qsTr("Cancel")
        onClicked: {
            id_SwipeView.currentIndex = 0
            id_DataForm.state = "stAdd"
        }
    }
    Button {
        id: id_btnEdit
        x: 40; y: 663;
        width: 150; height: 60
        visible: false
        text: qsTr("Edit")
        onClicked: {
            id_DataForm.state = "stEdit"
            //            idPwdHandler.saveEditedValues(id_keyTxt.pr_text, id_userTxt.pr_text, id_pwdTxt.pr_text, id_siteTxt.pr_text, id_notesTxt.pr_text)
        }
    }
    Connections{
        target: idPwdHandler
        onSendPwdDetails:{
            id_keyTxt.pr_text = key
            id_userTxt.pr_text = user
            id_pwdTxt.pr_text = pwd
            id_siteTxt.pr_text = site
            id_notesTxt.pr_text = notes
//            id_DataForm.state = "stView"
        }
    }
    states:[
        State{
            name: "stAdd"
            PropertyChanges { target:id_keyTxt; pr_defaultText: "id"; pr_readOnly: false; pr_textColor: "gray"; pr_text: ""}
            PropertyChanges { target:id_userTxt; pr_defaultText: "User"; pr_readOnly: false; pr_textColor: "gray"; pr_text: ""}
            PropertyChanges { target:id_pwdTxt; pr_defaultText: "pwd"; pr_readOnly: false; pr_textColor: "gray"; pr_text: ""}
            PropertyChanges { target:id_siteTxt; pr_defaultText: "website"; pr_readOnly: false; pr_textColor: "gray"; pr_text: ""}
            PropertyChanges { target:id_notesTxt; pr_defaultText: "notes..."; pr_readOnly: false; pr_textColor: "gray"; pr_text: ""}

            PropertyChanges { target:id_btnCancel; visible: true}
            PropertyChanges { target:id_btnSave; visible: true}
            PropertyChanges { target:id_btnDelete; visible: false}
            PropertyChanges { target:id_btnEdit; visible: false}
            PropertyChanges { target:id_btnConfirmDel; visible: false}
        },
        State{
            name: "stEdit"
            PropertyChanges { target:id_keyTxt; pr_readOnly: false; pr_textColor: "gray"}
            PropertyChanges { target:id_userTxt; pr_readOnly: false; pr_textColor: "gray"}
            PropertyChanges { target:id_pwdTxt; pr_readOnly: false; pr_textColor: "gray"}
            PropertyChanges { target:id_siteTxt; pr_readOnly: false; pr_textColor: "gray"}
            PropertyChanges { target:id_notesTxt; pr_readOnly: false; pr_textColor: "gray"}

            PropertyChanges { target:id_btnCancel;  visible: true}
            PropertyChanges { target:id_btnSave;  visible: true}
            PropertyChanges { target:id_btnDelete;  visible: false}
            PropertyChanges { target:id_btnEdit;  visible: false}
        },
        State{
            name: "stView"
            PropertyChanges { target:id_keyTxt; pr_readOnly: true}
            PropertyChanges { target:id_userTxt; pr_readOnly: true}
            PropertyChanges { target:id_pwdTxt; pr_readOnly: true}
            PropertyChanges { target:id_siteTxt; pr_readOnly: true}
            PropertyChanges { target:id_notesTxt; pr_readOnly: true}

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
