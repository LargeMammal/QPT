#ifndef NETSCAN_H
#define NETSCAN_H

#include <QObject>
#include <QDebug>
#include <QtNetwork>
#include <QNetworkAddressEntry>
#include <QNetworkInterface>
#include <QHostAddress>
#include <QHostInfo>
#include <QProcess>
#include <QJSValue>
#include <QJSEngine>
#include <QThread>
#include <QtConcurrent/QtConcurrentRun>

class netScan : public QObject
{
private:
    Q_OBJECT
    QJsonArray network;

public:
    explicit netScan(QObject *parent = nullptr);

    Q_INVOKABLE QString getAddresses(QJSValue, int = 100, int = 255);
    Q_INVOKABLE QJsonArray networkInfo();

    Q_INVOKABLE bool ping(QString, int = 100);
signals:
    void addNewElement(QString newElement);
public slots:
};

#endif // NETSCAN_H
