#include "methodcallsomeipmanager.h"

MethodCallSomeIPManager::MethodCallSomeIPManager(QObject *parent)
    : QObject{parent}
{
    std::cout << "piracer method call client initialize" << std::endl;
    runtime = CommonAPI::Runtime::get();
    proxy = runtime->buildProxy<PiracerProxy>("local", "Piracer");
    std::cout << "Checking availability from PiracerProxy!" << std::endl;
}

void MethodCallSomeIPManager::modeSelectCall(QVariant data)
{
    newMode = data.toUInt();
    proxy->modeSelect(newMode, callStatus, returnMessage);
    std::cout << "Got Return Message: '" << returnMessage << "Sent Message: "<< (int)newMode << "'\n";
}
