#ifndef METHODCALLSOMEIPMANAGER_H
#define METHODCALLSOMEIPMANAGER_H

#include <QObject>
#include <QVariant>
#include <QDebug>
#include <iostream>
#include <string>
#include <unistd.h>
#include <thread>
#include <typeinfo>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiracerProxy.hpp>
#include <v1/commonapi/PiracerProxyBase.hpp>

// CommonAPI definition
using namespace v1::commonapi;

class MethodCallSomeIPManager : public QObject
{
    Q_OBJECT
public:
    explicit MethodCallSomeIPManager(QObject *parent = nullptr);

public Q_SLOTS:
    Q_INVOKABLE void modeSelectCall(QVariant data); //method call

private:
    // CommonAPI vSomeIP var
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<PiracerProxy<>> proxy;
    CommonAPI::CallStatus callStatus;
    std::string returnMessage;

    uint8_t newMode;

};

#endif // METHODCALLSOMEIPMANAGER_H
