DESCRIPTION = "Plasma Mobile Phone Components"
HOMEPAGE = "https://community.kde.org/Plasma/Mobile/Code"
LICENSE = "GPL-2.0-only & GPL-2.0-or-later & GPL-3.0-only & LGPL-2.0-or-later & LGPL-2.1-only & LGPL-3.0-only"
LIC_FILES_CHKSUM = " \
    file://LICENSES/GPL-2.0-only.txt;md5=9e2385fe012386d34dcc5c9863070881 \
    file://LICENSES/GPL-2.0-or-later.txt;md5=9e2385fe012386d34dcc5c9863070881 \
    file://LICENSES/GPL-3.0-only.txt;md5=49fc03046e56a282c0c743b5d3a55b7c \
    file://LICENSES/LGPL-2.0-or-later.txt;md5=da48810c4ddf8e49efa031294a26b98c \
    file://LICENSES/LGPL-2.1-only.txt;md5=147a320ed8b16b036829a0c71d424153 \
    file://LICENSES/LGPL-3.0-only.txt;md5=8d51f5b5fd447f7a1040c3dc9f0a8de6 \
"

DEPENDS += " \
    kpackage-native \
    kauth-native \
    kcmutils-native \
    modemmanager-qt \
    gstreamer1.0 \
    qtdeclarative \
    telepathy-qt \
    kpeople \
    kdbusaddons \
    knotifications \
    kwin \
    networkmanager-qt \
    plasma-framework \
    plasma-workspace \
"

inherit kde-plasma gettext

PV = "${PLASMA_VERSION}"
SRC_URI[sha256sum] = "c3e4a08467613311f49015dbe0d0060442b8fe6d0d283ce87d1b435cc29b1fa1"

FILES:${PN} += " \
    ${datadir}/k*5 \
    ${datadir}/kpackage \
    ${datadir}/kwin \
    ${datadir}/metainfo \
    ${datadir}/plasma \
    ${datadir}/sounds \
    ${datadir}/wallpapers \
    ${datadir}/wayland-sessions \
    ${OE_QMAKE_PATH_QML} \
    ${OE_QMAKE_PATH_PLUGINS} \
"

RDEPENDS:${PN} += " \
    libqofono \
    qtvirtualkeyboard-plugins \
    qtvirtualkeyboard-qmlplugins \
"

