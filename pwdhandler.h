#ifndef PWDHANDLER_H
#define PWDHANDLER_H
#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QCryptographicHash>
#include "crypt.h"

class PwdHandler: public QObject
{
    Q_OBJECT
public:
    PwdHandler();
    QStringList getKeys();
    void loadJsonFile();
    Crypt cypher;

    Q_SIGNAL void sendPwdDetails(quint8 index,QString key, QString user, QString pwd, QString site, QString notes);
    Q_SIGNAL void sgn_pwdIsOk();
    Q_SIGNAL void sgn_pwdNotOk();

    Q_INVOKABLE bool requestDataOfIndex(quint8);
    Q_INVOKABLE bool deleteDataOfCurrentIndex();
    Q_INVOKABLE void saveEditedValues(QString key, QString user, QString pwd, QString site, QString note);
    Q_INVOKABLE void verifyPWD(QString pwd);
    Q_INVOKABLE bool changePwd(QString oldPwd, QString newPwd1, QString newPwd2);

private:
    QStringList jsonKeys, jsonUsers, jsonPwds, jsonSites, jsonNotes;
    quint16 m_CurrentIndex;
    QString myFile = "./test.json";

    //Saves to "myFile" what is in "jsonKeys, jsonUsers, jsonPwds, jsonSites, jsonNotes"
    void saveToJsonFile();
};

#endif // PWDHANDLER_H
