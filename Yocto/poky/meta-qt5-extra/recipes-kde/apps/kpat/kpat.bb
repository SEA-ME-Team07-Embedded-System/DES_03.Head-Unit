SUMMARY = "KPat offers a selection of solitaire card games"
LICENSE = "GPL-2.0-only & GFDL-1.2"
LIC_FILES_CHKSUM = " \
    file://COPYING;md5=dcd3ae65d2d4ac9f347f0614d3fd4794 \
    file://COPYING.DOC;md5=ad1419ecc56e060eccf8184a87c4285f \
"

inherit kde-apps gtk-icon-cache mime mime-xdg

DEPENDS += " \
    kauth-native \
    kconfig-native \
    kcoreaddons-native \
    kdoctools-native \
    kcompletion \
    kconfigwidgets \
    kcrash \
    kdbusaddons  \
    kguiaddons  \
    ki18n \
    kio \
    knewstuff \
    kwidgetsaddons  \
    kxmlgui \
    libkdegames \
    freecell-solver \
    black-hole-solver \
"

PV = "${KDE_APP_VERSION}"
SRC_URI[sha256sum] = "bcf7fe6d4aeea53c685b618e2b4e5bcdcd9c37d3373d06d2a0d5419cb6835f16"

FILES_SOLIBSDEV = ""

FILES:${PN} += " \
    ${datadir}/config.kcfg \
    ${datadir}/icons \
    ${datadir}/mime \
    ${datadir}/knsrcfiles \
    ${datadir}/kxmlgui5 \
    ${libdir}/libkcardgame.so \
"
