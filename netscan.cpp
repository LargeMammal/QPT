#include "netscan.h"

netScan::netScan(QObject *parent) : QObject(parent)
{

}

QString netScan::test()
{
    return "Hello from C++";
}

QString netScan::getAddresses()
{
    // This will get us localhost addresses.
    QHostInfo info = QHostInfo::fromName(QHostInfo::localHostName());
    QString text = "<h1>I found these addresses for this computer:</h1>";
    if(!info.addresses().isEmpty()) {
        for (int i = 0; i < info.addresses().count(); i++) {
            QHostAddress address = info.addresses()[i];
            if (QAbstractSocket::IPv4Protocol == address.protocol()){
                QPair<QHostAddress, int> p = QHostAddress::parseSubnet(address.toString());
                text += "<p>" + p.first.toString() + ", " + p.second + "</p>";
            }
        }

    }
    return text;
}
