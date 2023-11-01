
SUMMARY = "FTDI device driver (pure Python)"
HOMEPAGE = "http://github.com/eblot/pyftdi"
AUTHOR = "Emmanuel Blot <emmanuel.blot@free.fr>"
LICENSE = "CLOSED"

DEPENDS += "python3-setuptools-scm-native"

SRC_URI = "https://files.pythonhosted.org/packages/da/db/b900789a154e32dba50f132a2a76837331801f8b521b7e1bcbb852b01a35/pyftdi-0.55.0.tar.gz"
SRC_URI[md5sum] = "fa9feda5b80db51d538ed9b98e25504e"
SRC_URI[sha256sum] = "a747bbbccc4eeea26cefa2c8bd3d2b8bef8c94ecb6969bb9c75a63640887519a"

S = "${WORKDIR}/pyftdi-0.55.0"

RDEPENDS_${PN} = "python3-pyusb python3-pyserial"

inherit setuptools3
