
SUMMARY = "Types needed for type annotation that are not in `typing`"
HOMEPAGE = ""
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"
LICENSE = "CLOSED"

DEPENDS += "python3-setuptools-scm-native"

SRC_URI = "https://files.pythonhosted.org/packages/5f/36/e600e4aebafc447b0db7784aff7b8b9a8f7a6b13c8e15d07c8ee3ea88e9e/adafruit-circuitpython-typing-1.7.1.tar.gz"
SRC_URI[md5sum] = "7e33200dd15e7880b1eb22dd98221da9"
SRC_URI[sha256sum] = "30051d7f2a5eeaed67d72cbae5a627fab7be97f2dede2f47d1385d7d8dee2474"

S = "${WORKDIR}/adafruit-circuitpython-typing-1.7.1"

RDEPENDS_${PN} = "python3-adafruit-blinka python3-adafruit-circuitpython-busdevice python3-adafruit-circuitpython-request python3-typing-extensions"

inherit setuptools3
