DESCRIPTION = "QT headunit_setting application"
    
LICENSE = "CLOSED"

inherit cmake_qt5

SRC_URI += " \
file://CMakeLists.txt \ 
file://src/ \
file://src-gen/ \
"

S = "${WORKDIR}"

DEPENDS = " \
           qtbase \
           qtquickcontrols2 \
           qtlocation \
           qtdeclarative \
           qtmultimedia \
           qtwebengine \
           qtvirtualkeyboard \
           common-api-c++ \
           vsomeip \
           common-api-c++-someip \
           qtwayland \
"

RDEPENDS:{PN} += " \
        common-api-c++ \
        vsomeip \
        common-api-c++-someip \
"

#If we don't put install in cmake, we have to put this in bb.file(Use :append is for do not break default structure )
#do_install:append()
do_install(){
    install -d ${D}${bindir}
    install -m 0755 SettingPage ${D}${bindir}
}

EXTRA_OECMAKE += " \
                -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} \
                -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR} \
"
FILESEXTRAPATHS:prepend := "${THISDIR}/SettingPage:"
