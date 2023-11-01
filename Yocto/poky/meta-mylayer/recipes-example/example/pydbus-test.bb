DESCRIPTION = "pydbus example"
    
LICENSE = "CLOSED"
      
SRC_URI += "file://send_dbus.py \
            file://recv_dbus.py \
            file://dbus_send.py \
            file://dbus_qt_send.py \
            file://service_v.cpp \
            file://client_v.cpp"
S = "${WORKDIR}"
  
do_install(){
    install -d ${D}${bindir}
    install -m 0755 ${S}/send_dbus.py ${D}${bindir}
    install -m 0755 ${S}/recv_dbus.py ${D}${bindir}
    install -m 0755 ${S}/dbus_send.py ${D}${bindir}
    install -m 0755 ${S}/dbus_qt_send.py ${D}${bindir}
    install -m 0755 ${S}/service_v.cpp ${D}${bindir}
    install -m 0755 ${S}/client_v.cpp ${D}${bindir}
}
