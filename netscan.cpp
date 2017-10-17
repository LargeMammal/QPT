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
    QHostInfo info = QHostInfo::fromName(QHostInfo::localHostName());
    QString text = "<h1>I found these addresses for this computer:</h1>";
    if(!info.addresses().isEmpty()) {
        for (int i = 0; i < info.addresses().count(); i++) {
            QHostAddress address = info.addresses()[i];
            text += "<p>" + address.toString() + "</p>";
        }
    }

    return text;
}
