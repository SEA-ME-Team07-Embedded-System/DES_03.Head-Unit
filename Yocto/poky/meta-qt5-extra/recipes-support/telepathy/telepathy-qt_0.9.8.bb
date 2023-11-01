SUMMARY = "Telepathy-Qt"
HOMEPAGE = "https://telepathy.freedesktop.org/"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"

DEPENDS = "qtbase python3"

SRC_URI = " \
    git://github.com/TelepathyIM/telepathy-qt.git;branch=master;protocol=https \
"
SRCREV = "6ccb59117fdb261016d06b42167c24c99cbcecc4"
S = "${WORKDIR}/git"

inherit cmake_qt5 python3native cmake_lib

EXTRA_OECMAKE += " \
    -DDESIRED_QT_VERSION=5 \
    -DENABLE_TESTS=FALSE \
    -DENABLE_FARSTREAM=FALSE \
    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
"

CMAKE_ALIGN_SYSROOT[1] = "TelepathyQt5, -S${libdir}/lib, -s${OE_QMAKE_PATH_HOST_LIBS}/lib"
