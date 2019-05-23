#include "crypt.h"
#include "qdebug.h"

Crypt::Crypt()
{

}

QByteArray Crypt::encryptQBA(QByteArray qba){
    QByteArray cypherQBA;
    cypherQBA.append(qba);
    qDebug()<<cypherQBA.toBase64();
    return cypherQBA.toBase64();
}

QString Crypt::decryptQBA(QByteArray fileQBA){
    QByteArray plainQBA;
    plainQBA.append(fileQBA);
    qDebug()<<"Decrypted: "<<QByteArray::fromBase64(plainQBA);
    return QByteArray::fromBase64(plainQBA).data();
}


