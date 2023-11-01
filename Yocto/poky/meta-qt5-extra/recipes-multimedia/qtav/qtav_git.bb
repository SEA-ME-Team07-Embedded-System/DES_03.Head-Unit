SUMMARY = "A cross-platform multimedia framework based on Qt and FFmpeg"
HOMEPAGE = "https://www.qtav.org/"
AUTHOR = "Wang Bin"
LICENSE = "LGPL-2.1-only & GPL-3.0-only"
LIC_FILES_CHKSUM = "file://lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c \
                    file://gpl-3.0.txt;md5=d32239bcb673463ab874e80d47fae504"

inherit qmake5 mime-xdg

SRC_URI = "git://github.com/wang-bin/QtAV.git;protocol=https;branch=master"
SRCREV = "74943ea8f34d1c45e2dcae9810e3e25f5d4161c0"
PV = "git${SRCPV}"
S = "${WORKDIR}/git"

DEPENDS += "qtbase qtquickcontrols2 qtsvg ffmpeg"
RDEPENDS:${PN} += "qtquickcontrols2-qmlplugins"

PACKAGES += "${PN}-qmlplugins"

FILES:${PN}-qmlplugins = "${libdir}/qml/QtAV/*"

FILES:${PN}-dev += "${libdir}/libQtAVWidgets.prl \
                    ${libdir}/libQtAV.prl \
                    ${libdir}/mkspecs/*"
