SUMMARY = "A QML webview wrapper to support both QtWebEngine and Oxide"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = " \
	file://LICENSE;md5=959bffe2993816eb32ec4bc1ec1d5875 \
"

inherit qmake5

PV = "0.0.0+git${SRCPV}"

SRC_URI = "git://github.com/tim-sueberkrueb/${BPN}.git;protocol=https;branch=master"
SRCREV = "9d2fd26da9c38b2e5c4c1c4d994b193213559e2f"
S = "${WORKDIR}/git"

DEPENDS += "qtbase"

RDEPENDS:${PN} += " \
    qtwebengine-qmlplugins \
    qtdeclarative-qmlplugins \
"

FILES:${PN} += " \
    ${OE_QMAKE_PATH_QML}/SlimeEngine \
"
