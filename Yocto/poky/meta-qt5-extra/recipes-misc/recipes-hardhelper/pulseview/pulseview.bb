DESCRIPTION = "PulseView is a Qt based logic analyzer, oscilloscope and MSO GUI for sigrok."
HOMEPAGE = "http://sigrok.org/wiki/Main_Page"

LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

DEPENDS = " \
    boost \
    qttools-native \
    qttools \
    qtbase \
    qtsvg \
    libsigrok \
"

PACKAGECONFIG[decode] = "-DENABLE_DECODE=TRUE,-DENABLE_DECODE=FALSE,libsigrokdecode"

PACKAGECONFIG ??= "decode"

inherit cmake_qt5 pkgconfig mime-xdg

SRC_URI = " \
    git://github.com/sigrokproject/pulseview.git;branch=master;protocol=https \
    file://0001-Move-C-linking-below-standard-includes-to-fix-build-.patch \
"
SRCREV = "89b7b94a048ec53e82f38412a4b65cabb609f395"
PV = "0.4.2+git${SRCPV}"
S = "${WORKDIR}/git"

FILES:${PN} += "${datadir}/*"
