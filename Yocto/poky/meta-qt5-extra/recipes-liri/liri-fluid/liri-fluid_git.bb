SUMMARY = "Library for QtQuick apps with Material Design"
LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
"

inherit liri gtk-icon-cache

PV = "1.2.0+git${SRCPV}"
SRCREV = "da9434e97898ade0d8c351e7c11861301af242a8"
S = "${WORKDIR}/git"

DEPENDS += " \
    qtgraphicaleffects \
    qtquickcontrols2 \
    qtsvg \
"

do_configure:prepend() {
    (cd ${S} && ./scripts/fetch_icons.sh)
}

# docs -> qdocs -> clang-native
EXTRA_OECMAKE += " \
    -DFLUID_WITH_DOCUMENTATION=OFF \
"

FILES:${PN} += " \
    ${OE_QMAKE_PATH_QML} \
"
FILES:${PN}-dev += " \
    ${datadir}/icons \
    ${datadir}/metainfo \
    ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs \
"

RDEPENDS:${PN} += " \
    qtsvg-plugins \
"
