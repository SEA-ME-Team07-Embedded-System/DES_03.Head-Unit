
SUMMARY = "CircuitPython APIs for non-CircuitPython versions of Python such as CPython on Linux and MicroPython."
HOMEPAGE = "https://github.com/adafruit/Adafruit_Blinka"
AUTHOR = "Adafruit Industries <circuitpython@adafruit.com>"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=fccd531dce4b989c05173925f0bbb76c"


SRC_URI = "https://files.pythonhosted.org/packages/31/7f/73f807de16bc6a5bc40bc024bf9937cb9c1fdde462a093612e253f54e949/Adafruit-Blinka-8.23.0.tar.gz"
SRC_URI[md5sum] = "ae63d4cfa7a8e939042a118fef526b77"
SRC_URI[sha256sum] = "73569b9ff1a8edb1cab66ace655e0c5a97a26fcd9809eff62006e77c9a4a3c50"


#SRC_URI = "https://files.pythonhosted.org/packages/33/2f/889c3a970bc6b46c31cab04360a8f2c7b669088359fe50ed873010aae254/Adafruit-Blinka-8.25.0.tar.gz"
#SRC_URI[md5sum] = "a257cb9838e48997844ebc2b254620ca"
#SRC_URI[sha256sum] = "332f889c3a970bc6b46c31cab04360a8f2c7b669088359fe50ed873010aae254"


#SRC_URI = "file:///home/seame-workstation05/Downloads/Adafruit-Blinka-8.23.0.tar.gz"
#SRC_URI[md5sum] = "e84358e78f96aafd4e44adac862ded4c"
#SRC_URI[sha256sum] = "86ebc07e1b0bb118fb1929d2b89c201674263c016408f38f92e1db080add660b"

S = "${WORKDIR}/Adafruit-Blinka-8.23.0"

DEPENDS += "python3-setuptools-scm-native"

do_install:append() {
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein.license
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/amlogic/a311d/pulseio/libgpiod_pulsein
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/amlogic/a311d/pulseio/libgpiod_pulsein.license
}

#do_install:append() {
#rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein
#rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein.license
#rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/adafruit_blinka/microcontroller/amlogic/a311d/bcm283x/pulseio/libgpiod_pulsein
#rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/adafruit_blinka/microcontroller/amlogic/a311d/bcm283x/pulseio/libgpiod_pulsein.license
#}

RDEPENDS:${PN} += " \
    libgpiod \
    python3-adafruit-platformdetect \
    python3-adafruit-pureio \
    python3-core \
"

RDEPENDS:${PN}:append:rpi = " rpi-gpio"


inherit setuptools3

