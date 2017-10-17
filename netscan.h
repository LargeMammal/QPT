#ifndef NETSCAN_H
#define NETSCAN_H

#include <QObject>
#include <QDebug>
#include <QNetworkAddressEntry>
#include <QHostAddress>

class netScan : public QObject
{
private:
    Q_OBJECT
public:
    explicit netScan(QObject *parent = nullptr);

    Q_INVOKABLE void test();

signals:

public slots:
};

#endif // NETSCAN_H
