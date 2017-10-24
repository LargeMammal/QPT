#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "netscan.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QScopedPointer<netScan> scanner(new netScan);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("scanner", scanner.data());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
