#include "crypt.h"
#include "qdebug.h"
#include <QCryptographicHash>

Crypt::Crypt(){}

QByteArray Crypt::encryptQBA(QByteArray qba){
    QByteArray cypherQBA;
    cypherQBA.append(qba);
    //    qDebug()<<cypherQBA.toBase64();
    return cypherQBA.toBase64();
}

QString Crypt::decryptQBA(QByteArray fileQBA){
    QByteArray plainQBA;
    plainQBA.append(fileQBA);
    //    qDebug()<<"Decrypted: "<<QByteArray::fromBase64(plainQBA);
    return QByteArray::fromBase64(plainQBA).data();
}

void Crypt::verifyPwd(QString pwd){
    qDebug()<<"Pwd entered: "<<pwd;
    QByteArray hash = QCryptographicHash::hash(pwd.toLocal8Bit(), QCryptographicHash::Sha256);
    QByteArray masterHash = QCryptographicHash::hash(masterPwd.toLocal8Bit(), QCryptographicHash::Sha256);

    if (hash.compare(masterHash)){
        qDebug()<<"Wrong Password";
    }
    else{
        qDebug()<<"Same Password";
        Q_EMIT sgn_pwdIsOk();
    }
}

void Crypt::savePwd(QString pwd){
    Q_UNUSED(pwd);
}

bool Crypt::changePwd(QString oldPwd, QString newPwd1, QString newPwd2){
    Q_UNUSED(oldPwd);
    if(QString::compare(newPwd1, newPwd2, Qt::CaseSensitive)){
        qDebug()<<"not same pwd";
        return false;
    }
    else{
        qDebug()<<"samePwd";
        return true;
    }

}
