#ifndef CRYPT_H
#define CRYPT_H
#include <QObject>

class Crypt: public QObject
{
    Q_OBJECT
public:
    Crypt();
    QString decryptQBA(QByteArray fileQBA);
    QByteArray encryptQBA(QByteArray qba);

    void savePwd(QString pwd);
    void verifyPwd(QString pwd);
    bool changePwd(QString oldPwd, QString newPwd1, QString newPwd2);

    Q_SIGNAL void sgn_pwdIsOk();

private:
    QByteArray textBA;
    QByteArray text;
    //test
    QString masterPwd = "test";
};

#endif // ENCRYPT_H
