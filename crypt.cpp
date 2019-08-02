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
    QByteArray hashedPwd = hashPwd(pwd);

    QString qsPwd = pwdSettings.readSettings("Security","pwd");

    if (this->BAtoQString(hashedPwd) == qsPwd){
        qDebug()<<"Same Password";
        Q_EMIT sgn_pwdIsOk();
    }
    else{
        qDebug()<<"Incorrect Password";
        Q_EMIT sgn_pwdNotOk("Try Again"," The Password \n is not correct.");
    }
}

bool Crypt::changePwd(QString oldPwd, QString newPwd, QString repeatPwd){
    if(QString::compare(hashPwd(oldPwd), pwdSettings.readSettings("Security","pwd"), Qt::CaseSensitive)){
        qDebug()<<"not same pwd";
        Q_EMIT sgn_pwdNotOk("Error"," Old password \n doesn't match.");
        return false;
    }else{
        if(QString::compare(newPwd, repeatPwd, Qt::CaseSensitive)){
            qDebug()<<"both new pwd are diffetent";
            Q_EMIT sgn_pwdNotOk("Error"," Password and \n Confirmation \n differs.");
            return false;
        }
        else{
            qDebug()<<"All is ok, changing pwd";
            QString qsHashPwd;
            QByteArray qba;

            qba = hashPwd(newPwd);
            qsHashPwd = this->BAtoQString(qba);

            pwdSettings.writeSettings("Security","pwd", qsHashPwd);
            return true;
        }
    }
}

QByteArray Crypt::hashPwd(QString pwd){
    QByteArray pwdHashed = QCryptographicHash::hash(pwd.toLocal8Bit(), QCryptographicHash::Sha256);
    return pwdHashed;
}

QByteArray Crypt::QStoByteArray(QString qs){
    QByteArray ba;
    ba = qs.toUtf8();
    return ba;
}

QString Crypt::BAtoQString(QByteArray ba){
    QString qs = QString(ba);
    return qs;
}
