SUMMARY = "Utilities for working with KCModules"
LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGPL-2.0-or-later"
LIC_FILES_CHKSUM = " \
    file://LICENSES/GPL-2.0-only.txt;md5=93e64b4a83c7e441e48bbdeeea05c977 \
    file://LICENSES/GPL-3.0-only.txt;md5=1c76c4cc354acaac30ed4d5eefea7245 \
    file://LICENSES/LGPL-2.0-only.txt;md5=6d2d9952d88b50a51a5c73dc431d06c7 \
    file://LICENSES/LGPL-2.0-or-later.txt;md5=6d2d9952d88b50a51a5c73dc431d06c7 \
"

inherit kde-kf5 cmake_lib gettext

DEPENDS:class-target = " \
    ${BPN}-native \
    kcoreaddons-native \
    kauth-native \
    kconfig-native \
    kpackage-native \
    kitemviews \
    kconfigwidgets \
    ki18n \
    kiconthemes \
    kservice \
    kxmlgui \
    kdeclarative \
"

PV = "${KF5_VERSION}"
SRC_URI[sha256sum] = "757bcd8ea8ca1882612fdb4d4537e1932cfd23150f59931910e70b253bfa4ad2"
SRC_URI:append:class-native = " file://0001-Install-kcmdesktopfilegenerator-to-bindir.patch"
SRC_URI:append:class-target = " file://0002-Do-not-prefix-kcmdesktopfilegenerator-by-KF5.patch"

EXTRA_OECMAKE:append:class-native = " -DTOOLS_ONLY=ON"
EXTRA_OECMAKE:append:class-target = " -DTOOLS_ONLY=OFF"

CMAKE_ALIGN_SYSROOT[1] = "KF5KCMUtils, -s${_IMPORT_PREFIX}/libexec/kf5, -s${KDE_PATH_EXTERNAL_HOST_BINS}"
CMAKE_ALIGN_SYSROOT:class-native[1] = "ignore"

FILES:${PN} += " \
    ${OE_QMAKE_PATH_QML} \
    ${datadir}/kservicetypes5 \
"

BBCLASSEXTEND = "native"
