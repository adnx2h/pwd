#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QDebug>
#include <QMap>
#include <QQuickView>
#include <qqmlcontext.h>
#include "pwdhandler.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    PwdHandler pwdHandler;
    QStringList keys;

    pwdHandler.loadJsonFile();
    keys = pwdHandler.getKeys();


    //To execute pwdHandler's Q_INVOKABLE methods from QML
    engine.rootContext()->setContextProperty("idPwdHandler",&pwdHandler);

    engine.rootContext()->setContextProperty("keysModel",QVariant::fromValue(keys));

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
