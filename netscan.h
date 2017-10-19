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
    QVector<QString> addr;
    QString myAddr;
    Q_OBJECT
public:
    explicit netScan(QObject *parent = nullptr);

    Q_INVOKABLE QString test();
    Q_INVOKABLE QString getAddresses();
    Q_INVOKABLE bool ping(QString addr);

    Q_INVOKABLE QString getMyAddr() const;
    Q_INVOKABLE void setMyAddr(const QString &value);

    Q_INVOKABLE int getAddrLength();
    Q_INVOKABLE QString getAddr(int i);
    Q_INVOKABLE void setAddr(QString addr);

signals:

public slots:
};

#endif // NETSCAN_H
