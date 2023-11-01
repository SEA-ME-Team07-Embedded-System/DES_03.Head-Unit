SUMMARY = "Utility to capture the screen of a Liri desktop"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = " \
    file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
"

inherit liri qt5-translation

DEPENDS += " \
    qtquickcontrols2 \
    liri-wayland \
"

PV = "0.9.0+git${SRCPV}"
SRCREV = "fbec8fcf903588987d2f4e3bbf172b8915997a61"
S = "${WORKDIR}/git"
