SUMMARY = "File manager"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = " \
	file://LICENSE.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
"

inherit liri qt5-translation

PV = "0.2.0+git${SRCPV}"

SRCREV = "e30965465f71f9bf45f495a913e452d7d9fe752c"
S = "${WORKDIR}/git"

DEPENDS += " \
    qttools \
    qtquickcontrols2 \
    taglib \
    liri-fluid \
"

EXTRA_OECMAKE += "-DQt5LinguistTools_DIR=${STAGING_LIBDIR_NATIVE}/cmake/Qt5LinguistTools"

FILES:${PN} += " \
    ${datadir}/metainfo \
    ${OE_QMAKE_PATH_QML} \
"

RREPLACES:${PN} = "swordfish"
RPROVIDES:${PN} = "swordfish"
RCONFLICTS:${PN} = "swordfish"
