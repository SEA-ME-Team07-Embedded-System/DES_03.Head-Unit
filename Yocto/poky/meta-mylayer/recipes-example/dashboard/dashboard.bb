DESCRIPTION = "QT dashboard application"
    
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
           common-api-c++ \
           vsomeip \
           common-api-c++-someip\
"

RDEPENDS:{PN} += " \
        common-api-c++ \
        vsomeip \
        common-api-c++-someip\
"      
    
#do_install(){
#    install -d ${D}${bindir}
#    install -m 0755 dashboard ${D}${bindir}
#}

EXTRA_OECMAKE += " \
                -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} \
                -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR} \
"
