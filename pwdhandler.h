#ifndef PWDHANDLER_H
#define PWDHANDLER_H
#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>


class PwdHandler: public QObject
{
    Q_OBJECT
public:
    PwdHandler();
    QStringList getKeys();
    void loadJsonFile();

    Q_SIGNAL void sendPwdDetails(quint8 index,QString key, QString user, QString pwd, QString site, QString notes);

    //
    Q_INVOKABLE bool requestDataOfIndex(quint8);
    Q_INVOKABLE bool deleteDataOfCurrentIndex();

    Q_INVOKABLE void saveEditedValues(QString key, QString user, QString pwd, QString site, QString note);

private:
    QStringList jsonKeys, jsonUsers, jsonPwds, jsonSites, jsonNotes;
    quint16 m_CurrentIndex;
    QString myFile = "./test.json";

    //Saves to "myFile" what is in "jsonKeys, jsonUsers, jsonPwds, jsonSites, jsonNotes"
    void saveToJsonFile();

};

#endif // PWDHANDLER_H
