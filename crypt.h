#ifndef CRYPT_H
#define CRYPT_H
#include <QObject>
#include "settings.h"

class Crypt: public QObject
{
    Q_OBJECT
public:
    Crypt();
    QString decryptQBA(QByteArray fileQBA);
    QByteArray encryptQBA(QByteArray qba);

    void verifyPwd(QString pwd);
    bool changePwd(QString oldPwd, QString newPwd, QString repeatPwd);

    Q_SIGNAL void sgn_pwdIsOk();
    Q_SIGNAL void sgn_pwdNotOk();

private:
    Settings pwdSettings;
    QByteArray textBA;
    QByteArray text;
    QByteArray hashPwd(QString pwd);
    QByteArray QStoByteArray(QString qs);
    QString BAtoQString(QByteArray ba);
    //test
    QString defaulPwd = "1234";
};

#endif // ENCRYPT_H
