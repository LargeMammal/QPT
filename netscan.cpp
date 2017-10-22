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
