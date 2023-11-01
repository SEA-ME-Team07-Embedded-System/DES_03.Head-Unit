DESCRIPTION = "Tasks for desktop X11 applications to support anaconda"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PACKAGE_ARCH = "${TUNE_PKGARCH}"

inherit packagegroup features_check
REQUIRED_DISTRO_FEATURES = "x11"

XSERVER ??= ""

RDEPENDS:packagegroup-installer-x11-anaconda = "\
    dbus \
    xinput-calibrator \
    xserver-nodm-init \
    ${XSERVER} \
    liberation-fonts \
    xauth \
    xhost \
    xset \
    settings-daemon \
    xrandr \
    libsdl2 \
    metacity \
    adwaita-icon-theme \
    pango \
    pango-modules \
    createrepo-c"

