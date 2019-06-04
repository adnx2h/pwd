#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings();

    void writeSettings(const QString group, const QString key, const QString value);
    QString readSettings(const QString group, const QString key);

signals:

public slots:

private:
    const QString companyName;
    const QString applicationName;
    QSettings settings;
    const QString defaultPwd = "1234";
};

#endif // SETTINGS_H
