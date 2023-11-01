SUMMARY = "Lumina Desktop Environment"
HOMEPAGE = "https://lumina-desktop.org/"
LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=45b10a7bfb52b622b91ca67ea02e4afa"

REQUIRED_DISTRO_FEATURES = "x11"

QT_TRANSLATION_FILES = "${datadir}/*/i18n/*.qm"

inherit qmake5 features_check gtk-icon-cache qt5-translation manpages mime-xdg

DEPENDS += " \
    qttools-native \
    qtbase \
    qtx11extras \
    qtmultimedia \
    qtsvg \
"

SRC_URI = "git://github.com/lumina-desktop/lumina.git;branch=master;protocol=https"
SRCREV = "92360ecb0f9ddb7109456abf3ea1fb9fe750d92a"
S = "${WORKDIR}/git"
PV = "1.6.2"

do_configure:prepend() {
    # change paths by sed instead of endles escapes in 'DEFINES+=..' below
    sed -i 's:L_ETCDIR:QString("${sysconfdir}"):' `find ${S} -name *.cpp`
    sed -i 's:L_SHAREDIR:QString("${datadir}"):' `find ${S} -name *.cpp`
    sed -i 's:$${MAN_ZIP}:gzip -c:' `find ${S} -name *.pro`
}

# Override magic in src-qt5/OS-detect.pri to our paths
EXTRA_QMAKEVARS_PRE += ' \
    OS=Linux \
    PREFIX=${prefix} \
    L_BINDIR=${bindir} \
    L_LIBDIR=${libdir} \
    L_ETCDIR=${sysconfdir} \
    L_SHAREDIR=${datadir} \
    L_INCLUDEDIR=${STAGING_INCDIR} \
    L_SESSDIR=${datadir}/xsessions \
    L_MANDIR=${mandir} \
    LRELEASE=${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/lrelease \
    CONFIG+=WITH_I18N \
'

PACKAGES =+ "${PN}-icon-themes"

# We have to be very precise for ${datadir}/lumina-desktop otherwise locale
# packages remain empty
FILES:${PN} += " \
    ${datadir}/lthemeengine \
    ${datadir}/lumina-desktop/menu-scripts \
    ${datadir}/lumina-desktop/syntax_rules \
    ${datadir}/lumina-desktop/themes \
    ${datadir}/lumina-desktop/screensavers \
    ${datadir}/lumina-desktop/fluxbox* \
    ${datadir}/lumina-desktop/globs2 \
    ${datadir}/lumina-desktop/*.cfg \
    ${datadir}/lumina-desktop/*.png \
    ${datadir}/lumina-desktop/*.ogg \
    ${datadir}/lumina-desktop/*.conf \
    ${datadir}/lumina-desktop/*.jpg \
    ${datadir}/xsessions \
    ${OE_QMAKE_PATH_PLUGINS} \
"

FILES:${PN}-icon-themes = "${datadir}/icons"

RDEPENDS:${PN} += "fluxbox"
RRECOMMENDS:${PN} += "${PN}-icon-themes"
