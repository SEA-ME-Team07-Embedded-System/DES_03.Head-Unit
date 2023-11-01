SUMMARY = "ProductMD is a Python library providing parsers for metadata\
related to composes and installation media"
DESCRIPTION = "Product, compose and installation media metadata library"
HOMEPAGE = "http://productmd.readthedocs.io/en/latest/"
SECTION = "devel"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=768997ba510a952bef1775c50bc22b00"

SRC_URI = "git://github.com/release-engineering/productmd;protocol=https;branch=master \
           file://add-wrlinux-version-pattern.patch \
           "
SRCREV = "a8268944c8a6064697ccb4d24e52dc666ab03ed4"
S = "${WORKDIR}/git"
inherit setuptools3


