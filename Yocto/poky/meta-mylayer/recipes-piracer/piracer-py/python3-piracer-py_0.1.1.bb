
SUMMARY = "Simple abstraction layer for PiRacer and PiRacer Pro"
HOMEPAGE = "https://github.com/twyleg/piracer_py"
AUTHOR = "Torsten Wylegala <mail@twyleg.de>"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6decff0ca0b506b9b7a5f54ac3d286f8"

SRC_URI = "https://files.pythonhosted.org/packages/45/49/db0d0af4385cd18304d17b164d14139e1aa19d26ca52d62798ec3da7ba62/piracer_py-0.1.1.tar.gz"
SRC_URI[md5sum] = "ad5a99eef01e81ca86b173bfb2610be5"
SRC_URI[sha256sum] = "24cf0acd26812eee416b9c01454260b5dc860c819379589d3bf49cdee42bc950"

S = "${WORKDIR}/piracer_py-0.1.1"

#RDEPENDS_${PN} = "python3-wheel python3-rpi-gpio python3-adafruit-circuitpython-pca9685 python3-adafruit-circuitpython-ina219 python3-adafruit-circuitpython-ssd1306 python3-opencv-python"

inherit setuptools3
