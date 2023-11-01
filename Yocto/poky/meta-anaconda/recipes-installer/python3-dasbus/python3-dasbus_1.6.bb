SUMMARY = "Dasbus is a DBus library written in Python 3, based on GLib and inspired by pydbus."
HOMEPAGE = "https://dasbus.readthedocs.io"
SECTION = "devel"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"

SRC_URI = "git://github.com/rhinstaller/dasbus.git;protocol=https;branch=master"
SRCREV = "63b22fe4a7b2f98739279b2a4c6107eebd8d5a58"

S = "${WORKDIR}/git"

inherit setuptools3

RDEPENDS:${PN} = "python3-pygobject"
