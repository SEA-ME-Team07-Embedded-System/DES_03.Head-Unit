
SUMMARY = "CircuitPython library for INA219 high side DC current sensor."
HOMEPAGE = ""
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"
LICENSE = "CLOSED"

DEPENDS += "python3-setuptools-scm-native"

SRC_URI = "https://files.pythonhosted.org/packages/2d/46/be441d687c642f84adf8a965d7c1ab2bab9e22a69a7eb1852a52e6309988/adafruit-circuitpython-ina219-3.4.14.tar.gz"
SRC_URI[md5sum] = "76929af29af4ea784df1d22144c68753"
SRC_URI[sha256sum] = "fcf04aba6ab07a160663280a32474010d055eb9eaf6efebb5462483a7cef4217"

S = "${WORKDIR}/adafruit-circuitpython-ina219-3.4.14"

RDEPENDS_${PN} = "python3-adafruit-blinka python3-adafruit-circuitpython-register python3-adafruit-circuitpython-busdevice"

inherit setuptools3
