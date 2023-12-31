
SUMMARY = "CircuitPython frambuf module, based on the Python frambuf module."
HOMEPAGE = ""
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6ad4a8854b39ad474755ef1aea813bac"

DEPENDS += "python3-setuptools-scm-native"

SRC_URI = "https://files.pythonhosted.org/packages/b1/ca/56bf8071a95d2f2891c2fa2ddb9dbe7f67351c2fb1873a25c9b28d5e7bf7/adafruit-circuitpython-framebuf-1.4.11.tar.gz"
SRC_URI[md5sum] = "7954109585fd477a37d2dfb2d715fb6e"
SRC_URI[sha256sum] = "9f15959adcd02b8ca7105fcf720717f17ef9b0542f514e0d828abca35f8d910b"

S = "${WORKDIR}/adafruit-circuitpython-framebuf-1.4.11"

RDEPENDS_${PN} = "python3-adafruit-blinka python3-core"

inherit setuptools3
