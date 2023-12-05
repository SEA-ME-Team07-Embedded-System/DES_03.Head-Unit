
SUMMARY = "A built-package format for Python"
HOMEPAGE = ""
AUTHOR = " <Daniel Holth <dholth@fastmail.fm>>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"

DEPENDS += "python3-setuptools-scm-native"

SRC_URI = "https://files.pythonhosted.org/packages/a2/b8/6a06ff0f13a00fc3c3e7d222a995526cbca26c1ad107691b6b1badbbabf1/wheel-0.38.4.tar.gz"
SRC_URI[md5sum] = "83bb4e7bd4d687d398733f341a64ab91"
SRC_URI[sha256sum] = "965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac"

S = "${WORKDIR}/wheel-0.38.4"

RDEPENDS_${PN} = ""

inherit setuptools3
