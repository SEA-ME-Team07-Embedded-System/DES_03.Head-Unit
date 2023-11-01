SUMMARY = "Ark is KDE's file archiver"
LICENSE = "BSD-2-Clause & CC0-1.0 & GPL-2.0-or-later & LGPL-3.0-only & MIT"
LIC_FILES_CHKSUM = " \
    file://LICENSES/BSD-2-Clause.txt;md5=4e290b17e3e05732730de37b44abef90 \
    file://LICENSES/CC0-1.0.txt;md5=65d3616852dbf7b1a6d4b53b00626032 \
    file://LICENSES/GPL-2.0-or-later.txt;md5=9e2385fe012386d34dcc5c9863070881 \
    file://LICENSES/LGPL-3.0-only.txt;md5=7b8fde44990707e743d3613054065137 \
    file://LICENSES/MIT.txt;md5=4dd71a82d66fd9e3ca0cc65b8be370c0 \
"

inherit kde-apps gtk-icon-cache mime mime-xdg

DEPENDS += "\
    libarchive \
    libzip \
    karchive \
    kauth-native \
    kconfig-native \
    kcrash \
    kdbusaddons \
    kdoctools-native \
    ki18n \
    kiconthemes \
    khtml \
    kio \
    kservice \
    kpty \
    kwidgetsaddons \
    kitemmodels \
    sonnet-native \
"

PV = "${KDE_APP_VERSION}"
SRC_URI[sha256sum] = "9cc79811d95eb61e491a8ff6f0aebbab9b38b739ac4a5f66fe3807cd22a78065"

FILES:${PN} += " \
    ${datadir}/config.kcfg \
    ${datadir}/icons \
    ${datadir}/mime \
    ${datadir}/k*5 \
    ${OE_QMAKE_PATH_PLUGINS} \
"
