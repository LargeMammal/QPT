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

void netScan::getAddresses()
{
    // This will get us localhost addresses.
    QHostInfo info = QHostInfo::fromName(QHostInfo::localHostName());
    if(!info.addresses().isEmpty()) {
        for (int i = 0; i < info.addresses().count(); i++) {
            QHostAddress address = info.addresses()[i];
            if (QAbstractSocket::IPv4Protocol == address.protocol()){
                emit addNewElement(address.toString());
            }
        }
    }
}

bool netScan::ping(QString addr)
{
    QStringList parameters;
    //Windowsilla -n, linuxilla -c on ping yritysten määrä
    //-w on molemmissa timeout aika, winkkarilla millisekunneissa, linuxilla sekunneissa
#if defined(WIN32)
    parameters << "-n 1" << "-w 10";
#else
    parameters << "-c 1" << "-w 0.01";
#endif

    parameters << addr;

    int exitCode = QProcess::execute("ping", parameters);

    return exitCode==0;//jos laite sai yhteyden, exitCode on 0
}
