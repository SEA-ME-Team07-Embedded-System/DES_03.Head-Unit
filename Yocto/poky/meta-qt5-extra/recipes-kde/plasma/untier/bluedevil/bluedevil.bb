SUMMARY = "Integrate Bluetooth within KDE workspace and applications"
LICENSE = "GPL-2.0-only & GPL-2.0-or-later & GPL-3.0-only & GPL-3.0-or-later & LGPL-2.0-or-later & LGPL-2.1-only & LGPL-3.0-only"
LIC_FILES_CHKSUM = " \
    file://LICENSES/GPL-2.0-only.txt;md5=93e64b4a83c7e441e48bbdeeea05c977 \
    file://LICENSES/GPL-2.0-or-later.txt;md5=fed54355545ffd980b814dab4a3b312c \
    file://LICENSES/GPL-3.0-only.txt;md5=1c76c4cc354acaac30ed4d5eefea7245 \
    file://LICENSES/GPL-3.0-or-later.txt;md5=1c76c4cc354acaac30ed4d5eefea7245 \
    file://LICENSES/LGPL-2.0-or-later.txt;md5=6d2d9952d88b50a51a5c73dc431d06c7 \
    file://LICENSES/LGPL-2.1-only.txt;md5=fabba2a3bfeb22a6483d44e9ae824d3f \
    file://LICENSES/LGPL-3.0-only.txt;md5=c51d3eef3be114124d11349ca0d7e117 \
"

inherit kde-plasma gettext mime mime-xdg

DEPENDS += " \
    shared-mime-info-native \
    kauth-native \
    kcoreaddons \
    kcoreaddons-native \
    kdoctools-native \
    kpackage-native \
    kcmutils-native \
    kwidgetsaddons \
    kdbusaddons \
    knotifications \
    kwindowsystem \
    kiconthemes \
    plasma-framework \
    ki18n \
    kio \
    bluez-qt \
    kded \
"

PV = "${PLASMA_VERSION}"
SRC_URI[sha256sum] = "99983890f3739df999bbd03a0dd4dd0d386813a9f312818f26b4690534fedae0"

FILES:${PN} += " \
    ${datadir}/bluedevilwizard \
    ${datadir}/mime \
    ${datadir}/k*5 \
    ${datadir}/kpackage \
    ${datadir}/plasma \
    ${datadir}/remoteview \
    ${OE_QMAKE_PATH_PLUGINS} \
    ${OE_QMAKE_PATH_QML}/org/kde/plasma/private/bluetooth \
"
