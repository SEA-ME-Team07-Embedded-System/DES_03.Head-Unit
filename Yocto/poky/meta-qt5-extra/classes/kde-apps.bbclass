inherit kde-base

KDE_APP_VERSION = "22.08.3"

SRC_URI = "${KDE_MIRROR}/stable/release-service/${PV}/src/${BPN}-${PV}.tar.xz"

RRECOMMENDS:${PN} += "qtbase-plugins"
