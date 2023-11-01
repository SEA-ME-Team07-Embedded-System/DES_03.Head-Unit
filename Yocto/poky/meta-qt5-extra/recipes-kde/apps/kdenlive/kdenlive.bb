SUMMARY = "Kdenlive is an intuitive and powerful multi-track video editor"
LICENSE = "BSD-3-Clause & GPL-2.0-only & GPL-2.0-or-later & GPL-3.0-only & GPL-3.0-or-later & LGPL-3.0-only"
LIC_FILES_CHKSUM = " \
    file://LICENSES/BSD-3-Clause.txt;md5=f225922a2c12dfa5218fb70c49db3ea6 \
    file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
    file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
    file://LICENSES/GPL-3.0-only.txt;md5=8da5784ab1c72e63ac74971f88658166 \
    file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 \
    file://LICENSES/LGPL-3.0-only.txt;md5=7b8fde44990707e743d3613054065137 \
"

inherit kde-apps gtk-icon-cache mime mime-xdg

DEPENDS += "\
    shared-mime-info-native \
    kpackage-native \
    kcoreaddons-native \
    kdoctools-native \
    kauth-native \
    mlt \
    qtsvg \
    qtwebengine \
    qtnetworkauth \
    karchive \
    sonnet-native \
    kbookmarks \
    kconfig-native \
    kconfigwidgets \
    kdbusaddons \
    kfilemetadata \
    kio \
    kwidgetsaddons \
    kplotting \
    knotifyconfig \
    knewstuff \
    kxmlgui \
    knotifications \
    kguiaddons \
    ktextwidgets \
    kiconthemes \
    xapian-core \
    purpose \
    kdeclarative \
    v4l-utils \
"

PV = "${KDE_APP_VERSION}"
SRC_URI += "file://0001-CMakeLists.txt-make-MLT_PREFIX-configurable.patch"
SRC_URI[sha256sum] = "9c5cc37d24d99d1da4e708ef960fd4df828d3c0abdd4b02adbf7c37aa40d0e29"

EXTRA_OECMAKE += " \
    -DMLT_PREFIX=${prefix} \
    -DBUILD_TESTING=OFF \
"

FILES:${PN} += " \
    ${datadir}/config.kcfg \
    ${datadir}/icons \
    ${datadir}/k*5 \
    ${datadir}/knsrcfiles \
    ${datadir}/mime \
    ${datadir}/menu \
    ${OE_QMAKE_PATH_PLUGINS} \
"

RRECOMMENDS:${PN} += "ffmpeg"
