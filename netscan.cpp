#include "netscan.h"

netScan::netScan(QObject *parent) : QObject(parent)
{

}

QString netScan::getAddresses(QJSValue jsCallback, int timeout, int maxConsecutiveDeadIPs)
{
    QString text = "";

    QJsonArray net = network;
    if(network.isEmpty())
        net = networkInfo();

    //QJSValue val = "String from the c++ code";
    //jsCallback.call(QJSValueList{val});

    foreach (QJsonValue v, net) {
        QJsonObject obj = v.toObject();

        //Making sure we are only pinging subnets
        if(obj.contains("ExternalAddress"))
            continue;

        //Finding the address range
        quint32 addr = QHostAddress(obj.value("Network").toString()).toIPv4Address();
        int maxHostCount = obj.value("MaxHostCount").toString().toInt();

        QFuture<QString> future = QtConcurrent::run([](quint32 a, int count, int _timeout, int maxDeadIPs, netScan* t)->QString{
                                                        QString out = "";
                                                        //out += "Async function running!\n";

                                                        int lastAlive = 0;
                                                        for(int i = 1; i <= count && i < lastAlive + maxDeadIPs; i++)
                                                        {
                                                            QString address = QHostAddress(a+i).toString();
                                                            if(t->ping(address, _timeout))
                                                            {
                                                                lastAlive = i;
                                                                out += address+"\n";
                                                                //jsCallback.call(QJSValueList{address+"\n"});
                                                            }
                                                        }//*/

                                                        return out;
                                                    }, addr, maxHostCount, timeout, maxConsecutiveDeadIPs, this);

        //Notifying the user that we are doing something
        jsCallback.call(QJSValueList{"Pinging from "+QHostAddress(addr+1).toString()+" to "+QHostAddress(addr+maxHostCount).toString()+"\n"});

        while(!future.isFinished() && future.isRunning())
            QCoreApplication::processEvents();

        text += "These addresses answered to ping:\n"+future.result();

    }

    return text;
}

QJsonArray netScan::networkInfo()
{
    QJsonArray arr;

    QList<QNetworkInterface> allInterfaces = QNetworkInterface::allInterfaces();
    QNetworkInterface eth;

    foreach (eth, allInterfaces) {
        QList<QNetworkAddressEntry> allEntries = eth.addressEntries();

        QNetworkAddressEntry entry;
        foreach (entry, allEntries) {

            if(entry.ip().protocol() != QAbstractSocket::IPv4Protocol || entry.netmask().isNull())
                continue;

            if(entry.prefixLength() >= 32)
            {
                arr += QJsonObject
                {
                    {"ExternalAddress", entry.ip().toString()}
                };
                continue;
            }

            quint32 network = entry.netmask().toIPv4Address() & entry.ip().toIPv4Address();
            int maxHosts = pow(2, 32 - entry.prefixLength()) - 2;

            qDebug() << entry.ip().toString();
            arr += QJsonObject
            {
                {"Address", entry.ip().toString()},
                {"Netmask", entry.netmask().toString()},
                {"Network", QHostAddress(network).toString()},
                {"NetworkSize", QString::number(entry.prefixLength())},
                {"Broadcast", QHostAddress(network | ~entry.netmask().toIPv4Address()).toString()},
                {"HostMin", QHostAddress(network + 1).toString()},
                {"HostMax", QHostAddress(network + maxHosts).toString()},
                {"MaxHostCount", QString::number(maxHosts)}
            };
        }
    }
    network = arr;
    return arr;
}

bool netScan::ping(QString addr, int timeout)
{
    QStringList parameters;
    //On Windows: -n and on linux: -c is the amount of times we try pinging the target
    //On both -w is the timeout, though, on windows it's in milliseconds and on linux in seconds
    //TODO: Find the cause for and fix the weird freezes on android
#if defined(WIN32)
    parameters << "-n" << "1" << "-w" << QString::number(timeout);
#else
    parameters << "-c 1" << "-w" << QString::number(0.001 * timeout);
#endif

    parameters << addr;

    int exitCode = QProcess::execute("ping", parameters);

    return exitCode==0;//If the device got a response the exitCode is 0
}
