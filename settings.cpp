#include "settings.h"
#include "qdebug.h"
#include <QCoreApplication>
#include <QCryptographicHash>

Settings::Settings()
{
    QCoreApplication::setOrganizationName("AdnCorp");
    QCoreApplication::setApplicationName("pwd");
    QString qsHashPwd;
    QByteArray pwdHashed;

    QSettings settings("pwdrc", QSettings::IniFormat);
    settings.beginGroup("Security");
    if(!settings.contains("pwd")){
//        qDebug()<<"=Set Default pwd=";
        pwdHashed = QCryptographicHash::hash(defaultPwd.toLocal8Bit(), QCryptographicHash::Sha256);
        qsHashPwd = QString(pwdHashed);
        writeSettings("Security","pwd", qsHashPwd);
    }
    settings.endGroup();
}

void Settings::writeSettings(const QString group ,const QString key, const QString value){
    QSettings settings("pwdrc", QSettings::IniFormat);
    settings.beginGroup(group);
    settings.setValue(key, value);
    QString aa = settings.value(key).toString();
    settings.endGroup();
}

QString Settings::readSettings(const QString group,const QString key){
    QSettings settings("pwdrc", QSettings::IniFormat);
    QString value;
    QString defaultValue ="a";
    QVariant qv(defaultValue);

    settings.beginGroup(group);
    value = settings.value(key,qv).toString();
    settings.endGroup();
    return value;
}
