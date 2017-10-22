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
    QVector<QString> addr;
    QString myAddr;
public:
    explicit netScan(QObject *parent = nullptr);

    Q_INVOKABLE void getAddresses();

    Q_INVOKABLE QString getMyAddr() const;
    Q_INVOKABLE void setMyAddr(const QString &value);

    Q_INVOKABLE int getAddrLength();
    Q_INVOKABLE QString getAddr(int index);
    Q_INVOKABLE void setAddr(QString);

signals:
    void addNewElement(QString newElement);
public slots:
};

#endif // NETSCAN_H
