#include "netscan.h"

netScan::netScan(QObject *parent) : QObject(parent)
{

}

void netScan::test()
{
    qDebug() << "Hello from C++";
}
