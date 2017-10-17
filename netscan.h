#ifndef NETSCAN_H
#define NETSCAN_H

#include <QObject>
#include <QDebug>
#include <QtNetwork>
#include <QNetworkAddressEntry>
#include <QHostAddress>
#include <QHostInfo>

class netScan : public QObject
{
private:
    Q_OBJECT
public:
    explicit netScan(QObject *parent = nullptr);

    Q_INVOKABLE QString test();
    Q_INVOKABLE QString getAddresses();

signals:

public slots:
};

#endif // NETSCAN_H
