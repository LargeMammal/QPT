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
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    engine.rootContext()->setContextProperty("scanner", scanner.data());

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
