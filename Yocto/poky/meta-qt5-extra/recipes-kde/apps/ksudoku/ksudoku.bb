SUMMARY = "KSudoku is a logic-based symbol placement puzzle"
LICENSE = "GPL-2.0-only & GFDL-1.2"
LIC_FILES_CHKSUM = " \
    file://COPYING;md5=7974e16b472f00bbbadf2d006aa00c50 \
    file://COPYING.DOC;md5=ad1419ecc56e060eccf8184a87c4285f \
"

inherit kde-apps gtk-icon-cache features_check

REQUIRED_DISTRO_FEATURES = "x11 opengl"

DEPENDS += " \
    libglu \
    kauth-native \
    kconfig-native \
    kcoreaddons-native \
    kdoctools-native \
    karchive \
    kconfigwidgets \
    kcrash \
    kguiaddons \
    ki18n \
    kiconthemes \
    kio \
    kjobwidgets \
    kwidgetsaddons  \
    kxmlgui \
    libkdegames \
"

PV = "${KDE_APP_VERSION}"
SRC_URI[sha256sum] = "c779ec124ce0697fdbfa92a9fd0b3e4e4f243dc74ebf35bfd05703933d040e7d"

FILES:${PN} += " \
    ${datadir}/icons \
    ${datadir}/kxmlgui5 \
"
