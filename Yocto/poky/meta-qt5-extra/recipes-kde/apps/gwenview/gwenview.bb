SUMMARY = "A fast and easy to use image viewer for KDE"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=5a3169a2d39a757efd8b7aa66a69d97b"

inherit kde-apps gettext mime-xdg

DEPENDS += " \
    kdelibs4support-native \
    kdoctools-native \
    jpeg \
    exiv2 \
    lcms \
    phonon \
    kdelibs4support \
    kded \
    kactivities \
    kcoreaddons-native \
    kconfig-native \
    kauth-native \
    sonnet-native \
    kxmlgui \
    kfilemetadata \
    baloo \
    libkdcraw \
    kimageannotator \
"

PV = "${KDE_APP_VERSION}"
SRC_URI[sha256sum] = "f125eb729dd81ea265471c9bbca54fe6a7e87348c9a782b321331da72a02aa6e"

EXTRA_OECMAKE += " \
    -DJPEGLIB_RUN_RESULT=true \
    -DJPEGLIB_RUN_RESULT__TRYRUN_OUTPUT=0 \
"

FILES:${PN} += " \
    ${datadir}/k*5 \
    ${datadir}/icons \
    ${datadir}/solid \
    ${datadir}/kconf_update \
    ${OE_QMAKE_PATH_PLUGINS} \
"
