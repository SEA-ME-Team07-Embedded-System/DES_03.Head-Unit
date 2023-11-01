SUMMARY = "A text UI framework"
DESCRIPTION = "This is a text UI framework originally which \
was a part of the Anaconda installer project."
HOMEPAGE = "https://github.com/rhinstaller/python-simpleline"
SECTION = "devel"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=5f4f48e95324081879552f19cd16c54a"

SRC_URI = "git://github.com/rhinstaller/python-simpleline;protocol=https;branch=master"
SRCREV = "1c21ffdeda9eed27e5ad8ec16aee467f8daecd50"
S = "${WORKDIR}/git"

inherit setuptools3_legacy
