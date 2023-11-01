SUMMARY = "Process launcher to speed up launching KDE applications"
LICENSE = "BSD-3-Clause & LGPL-2.0-only & LGPL-2.1-only & LGPL-3.0-only"
LIC_FILES_CHKSUM = " \
    file://LICENSES/BSD-3-Clause.txt;md5=954f4d71a37096249f837652a7f586c0 \
    file://LICENSES/LGPL-2.0-only.txt;md5=6d2d9952d88b50a51a5c73dc431d06c7 \
    file://LICENSES/LGPL-2.1-only.txt;md5=fabba2a3bfeb22a6483d44e9ae824d3f \
    file://LICENSES/LGPL-3.0-only.txt;md5=c51d3eef3be114124d11349ca0d7e117 \
"

inherit kde-kf5 gettext

DEPENDS += " \
    libcap-native \
    kcoreaddons-native \
    kauth-native \
    kconfig kconfig-native \
    kdoctools-native \
    kservice \
    kio \
    ki18n \
    kwindowsystem \
    kcrash \
    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "virtual/libx11", "", d)} \
"

PV = "${KF5_VERSION}"
SRC_URI[sha256sum] = "2302add7e43a9a32aa9a3d5a73e52757e0b321efea6b15a565bf9f683dd60177"

FILES:${PN} += "${datadir}/dbus-1 ${libdir}/libkdeinit5_klauncher.so"
FILES:${PN}-dev = "${libdir}/cmake"

RDEPENDS_${PN} += "libcap-bin"
