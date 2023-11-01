SUMMARY = "LIRI Calculator"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = " \
	file://LICENSE.GPLv3;md5=8f0e2cd40e05189ec81232da84bd6e1a \
"

inherit liri qt5-translation gtk-icon-cache

DEPENDS += " \
    qtquickcontrols2 \
    liri-fluid \
"

SRCREV = "eecda4097027ee4730bb7dd86ec1895091ce4c7f"
S = "${WORKDIR}/git"
PV = "1.2.0+git${SRCPV}"

FILES:${PN} += " \
    ${datadir}/metainfo \
"
