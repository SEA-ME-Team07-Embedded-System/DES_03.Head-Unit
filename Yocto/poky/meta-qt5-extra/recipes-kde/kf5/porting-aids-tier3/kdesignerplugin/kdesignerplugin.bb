require ${BPN}.inc

inherit cmake_lib gettext

DEPENDS += " \
	${BPN}-native \
    kauth-native \
    sonnet-native \
    kdoctools-native \
    qttools \
    kcoreaddons \
    kconfig \
    kcompletion \
    kconfigwidgets \
    kiconthemes \
    kio \
    kitemviews \
    ktextwidgets \
    kwidgetsaddons \
    kxmlgui \
    sonnet \
    ki18n \
    kplotting \
"

SRC_URI += "file://0001-set-kgendesignerplugin-executable-so-that-it-can-be-.patch"

PACKAGECONFIG ??= ""
PACKAGECONFIG[kplotting] = "-DWITH_KPLOTTING=ON,,kplotting"
PACKAGECONFIG[kdewebkit] = "-DWITH_KDEWEBKIT=ON,,kdewebkit"

# native binaries
CMAKE_ALIGN_SYSROOT[1] = "KF5DesignerPlugin, -s${_IMPORT_PREFIX}/bin, -s${KDE_PATH_EXTERNAL_HOST_BINS}"

FILES:${PN} += "${libdir}/plugins/designer"
