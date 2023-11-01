require ${BPN}.inc

DEPENDS = " \
    ${BPN}-native \
    qtsvg \
    glew \
    openbabel \
    libeigen \
    molequeue \
    spglib \
    libmsym \
    libarchive \
    msgpack-cpp \
    mmtf-cpp \
"

inherit cmake_extra_sanity features_check

REQUIRED_DISTRO_FEATURES = "opengl"

SRC_URI += " \
    file://0001-Avoid-RPATH-if-not-configured.patch \
    file://0002-AvogadroLibsConfig.cmake-Find-include.patch \
    file://0003-qtplugins-CMakeLists.txt-Remove-full-path-from-inlcu.patch \
"

do_configure:append() {
    # fix python executable path to not point to sysroot
    sed -i 's:pythonInterpreterPath =.*:pythonInterpreterPath = "${bindir}/python3";:g' ${B}/avogadro/qtgui/avogadropython.h
    # fix absolute sysroot library paths
    for cmakefile in `find ${B}/CMakeFiles -name AvogadroLibsTargets.cmake`; do
        sed -i \
            -e 's:${STAGING_LIBDIR}/libGLEW.so:GLEW:g' \
            -e 's:${STAGING_LIBDIR}/libGL.so:GL:g' \
            -e 's:${STAGING_LIBDIR}/libGLU.so:GLU:g' \
            -e 's:${STAGING_LIBDIR}/libarchive.so:archive:g' \
            "$cmakefile"
    done
}

EXTRA_OECMAKE += "-DENABLE_RPATH=OFF"

FILES:${PN} += " \
    ${datadir}/avogadro2 \
    ${libdir}/avogadro2/scripts \
"

FILES:${PN}-staticdev += " \
    ${libdir}/avogadro2/staticplugins \
    ${libdir}/avogadro2/*.a \
"
