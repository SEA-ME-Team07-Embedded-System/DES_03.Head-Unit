SUMMARY = "GUI for diagramming Unified Modelling Language (UML)"
LICENSE = "GPL-2.0-only & GFDL-1.2 & LGPL-2.0-only"
LIC_FILES_CHKSUM = " \
    file://COPYING;md5=7974e16b472f00bbbadf2d006aa00c50 \
    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
    file://COPYING.DOC;md5=24ea4c7092233849b4394699333b5c56 \
"

inherit kde-apps gtk-icon-cache mime-xdg

DEPENDS += " \
    kcoreaddons-native \
    kdoctools-native \
    kconfig-native \
    sonnet-native \
    kdelibs4support-native \
    kdesignerplugin-native \
    \
    qtsvg \
    qtwebkit \
    \
    karchive \
    kauth-native \
    kcompletion \
    ki18n \
    kiconthemes \
    kio \
    ktexteditor \
    kwidgetsaddons \
    kxmlgui \
    kdelibs4support \
"

PV = "${KDE_APP_VERSION}"
SRC_URI[sha256sum] = "3e3e8ebc4e57100a9a73f26c1c4b9bdc8ad64b9e1fe7176301514a96e4562130"

EXTRA_OECMAKE += "-DBUILD_KF5=1"

PACKAGECONFIG ?= " \
    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', 'clang', '', d)} \
"

PACKAGECONFIG[clang] = ",,clang,clang"

FILES:${PN} += " \
    ${datadir}/kxmlgui5 \
    ${datadir}/umbrello5 \
"
