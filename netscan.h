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

class netScan : public QObject
{
private:
    Q_OBJECT
    QJsonArray network;
public:
    explicit netScan(QObject *parent = nullptr);

    Q_INVOKABLE QString getAddresses();
    Q_INVOKABLE QJsonArray networkInfo();

    Q_INVOKABLE QString getMyAddr() const;
    Q_INVOKABLE void setMyAddr(const QString &value);

    Q_INVOKABLE int getAddrLength();
    Q_INVOKABLE QString getAddr(int index);
    Q_INVOKABLE void setAddr(QString);

    Q_INVOKABLE bool ping(QString addr);
signals:
    void addNewElement(QString newElement);
public slots:
};

#endif // NETSCAN_H
