#include "pwdhandler.h"
#include "qdebug.h"
#include <QFile>
#include <QFileInfo>

PwdHandler::PwdHandler()
{

}
QStringList PwdHandler::getKeys(){
    return jsonKeys;
}

bool PwdHandler::requestDataOfIndex(quint8 index){
    //Holds the current selected index
    m_CurrentIndex = index;
    Q_EMIT sendPwdDetails(index,jsonKeys.at(index), jsonUsers.at(index), jsonPwds.at(index), jsonSites.at(index), jsonNotes.at(index));
    //    qDebug() <<"C++ The index is: "<<index;
    //    qDebug()<<"User: "<<jsonUsers.at(index);
    return true;
}

bool PwdHandler::deleteDataOfCurrentIndex(){
    jsonKeys.removeAt(m_CurrentIndex);
    jsonUsers.removeAt(m_CurrentIndex);
    jsonPwds.removeAt(m_CurrentIndex);
    jsonSites.removeAt(m_CurrentIndex);
    jsonNotes.removeAt(m_CurrentIndex);

    saveToJsonFile();
    qDebug()<<"Pwd deleted";

    return true;
}

void PwdHandler::loadJsonFile(){
    QJsonValue json_val, subObjUser, subObjPwd, subObjSite, subObjNotes;
    QJsonDocument json_dcto;
    QJsonObject json_object;
    QString fileContent;
    QFile jsonFile;

    jsonFile.setFileName(myFile);

    if(jsonFile.exists()){
        qDebug("File exists");

        jsonFile.open(QIODevice::ReadOnly);
        fileContent = jsonFile.readAll();

        jsonFile.close();
    }
    else {
        qDebug("File not exists\n Creating it");
        jsonFile.open(QIODevice::ReadWrite);
        jsonFile.write("{\"test\": {\"Notes\": \"1\",\"Pwd\": \"2\",\"Site\": \"3\",\"User\": \"4\"}}");
        fileContent = jsonFile.readAll();
        jsonFile.close();
    }


    QFileInfo fileInfo(jsonFile.fileName());
    QString filename(fileInfo.absoluteFilePath());
    qDebug("Path: ");
    qDebug()<<filename;

    //Parse file
    json_dcto = QJsonDocument::fromJson(fileContent.toUtf8());
    json_object = json_dcto.object();
    jsonKeys = json_object.keys();

    foreach(const QString &item, jsonKeys){
        json_val = json_object.value(item);

        subObjUser = json_val["User"];
        subObjPwd = json_val["Pwd"];
        subObjSite = json_val["Site"];
        subObjNotes = json_val["Notes"];

        jsonUsers += subObjUser.toString();
        jsonPwds += subObjPwd.toString();
        jsonSites += subObjSite.toString();
        jsonNotes += subObjNotes.toString();
    }
}

void PwdHandler::saveEditedValues(QString key, QString user, QString pwd, QString site, QString note){
    //Add the new values to local variables,
    jsonKeys.append(key);
    jsonUsers.append(user);
    jsonPwds.append(pwd);
    jsonSites.append(site);
    jsonNotes.append(note);

    saveToJsonFile();
}

void PwdHandler::saveToJsonFile() {
    QFile jsonFile(myFile);
    QJsonDocument doc;
    QJsonObject obj;
    QVariantMap map;
    quint16 index;

    index = 0;
    foreach(const QString &key, jsonKeys){
        //add to obj each pair
        obj["User"] = jsonUsers.at(index);
        obj["Pwd"] = jsonPwds.at(index);
        obj["Notes"] = jsonNotes.at(index);
        obj["Site"] = jsonSites.at(index);

        //creates a JsonDocument with the object
        doc = QJsonDocument::fromVariant(obj);

        //Creates a map (key + User-Pwd-Notes-Site)
        map.insert(key,obj);

        //Convert map to JsonDocument
        doc = QJsonDocument::fromVariant(map);
        index++;
    }

    jsonFile.open(QFile::WriteOnly);
    jsonFile.write(doc.toJson());
    jsonFile.close();
    qDebug()<<"Saved file";
}
