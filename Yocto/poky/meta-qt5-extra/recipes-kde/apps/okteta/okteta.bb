SUMMARY = "Okteta is a simple hex editor"
LICENSE = "BSD-3-Clause & GFDL-1.2+ & GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only & LGPL-2.1-or-later & LGPL-3.0-only"
LIC_FILES_CHKSUM = " \
    file://LICENSES/BSD-3-Clause.txt;md5=954f4d71a37096249f837652a7f586c0 \
    file://LICENSES/GFDL-1.2-or-later.txt;md5=9a4c4207e152ff95aa8539e9c1ed53e9 \
    file://LICENSES/GPL-2.0-only.txt;md5=93e64b4a83c7e441e48bbdeeea05c977 \
    file://LICENSES/GPL-3.0-only.txt;md5=1c76c4cc354acaac30ed4d5eefea7245 \
    file://LICENSES/LGPL-2.1-only.txt;md5=fabba2a3bfeb22a6483d44e9ae824d3f \
    file://LICENSES/LGPL-2.1-or-later.txt;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
    file://LICENSES/LGPL-3.0-only.txt;md5=c51d3eef3be114124d11349ca0d7e117 \
"

inherit kde-apps gtk-icon-cache mime

DEPENDS += " \
    qca \
    kauth-native \
    kconfig-native \
    kcoreaddons-native \
    kcmutils-native \
    kbookmarks \
    kcodecs \
    kcompletion \
    kconfigwidgets \
    kdbusaddons \
    kdoctools-native \
    sonnet-native \
    kiconthemes \
    ki18n \
    kcmutils \
    kio \
    knewstuff \
    kparts \
    kservice \
    kwidgetsaddons \
    kxmlgui \
    shared-mime-info-native \
"

# After 17.2.3 okteta left KDE application release cycle and continued
# with 0.25.0. To avoid package version going backwards set epoch;
PE = "1"
PV = "0.26.9"
SRC_URI = "https://download.kde.org/stable/okteta/${PV}/src/${BPN}-${PV}.tar.xz"
SRC_URI[sha256sum] = "16854c4d4e94838219ae3115a42ba385fda5c87dc6c9865ac90d3774f8d05ffb"

FILES:${PN} += " \
    ${datadir}/config.kcfg \
    ${datadir}/k*5 \
    ${datadir}/mime \
    ${datadir}/knsrcfiles \
    ${OE_QMAKE_PATH_PLUGINS} \
"
