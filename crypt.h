#ifndef CRYPT_H
#define CRYPT_H
#include <QObject>

class Crypt
{
public:
    Crypt();
    QString decryptQBA(QByteArray fileQBA);
    QByteArray encryptQBA(QByteArray qba);
private:
    QByteArray textBA;
    QByteArray text;
};

#endif // ENCRYPT_H
