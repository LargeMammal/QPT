#include "netscan.h"
#include "netscan.h"

QString netScan::getMyAddr() const
{
    return myAddr;
}

void netScan::setMyAddr(const QString &value)
{
    myAddr = value;
}

int netScan::getAddrLength()
{
    return addr.length();
}

QString netScan::getAddr(const int index)
{
    return addr[index];
}

void netScan::setAddr(const QString newAddr)
{
    addr.append(newAddr);
}

netScan::netScan(QObject *parent) : QObject(parent)
{

}

QString netScan::getAddresses()
{
    QString text = "";

    QList<QNetworkInterface> allInterfaces = QNetworkInterface::allInterfaces();
    QNetworkInterface eth;

    foreach (eth, allInterfaces) {
        QList<QNetworkAddressEntry> allEntries = eth.addressEntries();

        QNetworkAddressEntry entry;
        foreach (entry, allEntries) {

            if(entry.ip().protocol() != QAbstractSocket::IPv4Protocol || entry.netmask().isNull())
                continue;

            quint32 network = entry.netmask().toIPv4Address() & entry.ip().toIPv4Address();
            int maxHosts = pow(2, 32 - entry.prefixLength()) - 2;

            qDebug() << entry.ip().toString();
            text += "Address: " + entry.ip().toString()
                    + "\nNetmask: " + entry.netmask().toString() + " = " + QString::number(entry.prefixLength())
                    + "\nNetwork: " + QHostAddress(network).toString() + "/" + QString::number(entry.prefixLength())
                    + "\nBroadcast: " + QHostAddress(network | ~entry.netmask().toIPv4Address()).toString()
                    + "\nHostMin: " + QHostAddress(network + 1).toString()
                    + "\nHostMax: " + QHostAddress(network + maxHosts).toString()
                    + "\nMaxHostCount: " + QString::number(maxHosts)
                    + "\n======================\n";
        }
    }

    return text;
}

bool netScan::ping(QString addr)
{
    QStringList parameters;
    //On Windows: -n and on linux: -c is the amount of times we try pinging the target
    //On both -w is the timeout, though, on windows it's in milliseconds and on linux in seconds
#if defined(WIN32)
    parameters << "-n" << "1" << "-w" << "10";
#else
    parameters << "-c 1" << "-w 0.01";
#endif

    parameters << addr;

    int exitCode = QProcess::execute("ping", parameters);

    return exitCode==0;//If the device got a response the exitCode is 0
}
