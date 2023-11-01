SUMMARY = "Abstraction to system policy and authentication features"
LICENSE = "BSD-3-Clause & LGPL-2.0-or-later & LGPL-2.1-or-later"
LIC_FILES_CHKSUM = " \
    file://LICENSES/BSD-3-Clause.txt;md5=954f4d71a37096249f837652a7f586c0 \
    file://LICENSES/LGPL-2.0-or-later.txt;md5=6d2d9952d88b50a51a5c73dc431d06c7 \
    file://LICENSES/LGPL-2.1-or-later.txt;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
"

inherit kde-kf5 cmake_lib features_check

REQUIRED_DISTRO_FEATURES:class-target = "polkit"

PV = "${KF5_VERSION}"
SRC_URI[sha256sum] = "36ba733733c8600b2b8ba7736dc78c3c4e817aa91c7bc91407b69d4be01bbf93"

DEPENDS += "kcoreaddons"
DEPENDS:append:class-target = " \
    ${BPN}-native \
    polkit-qt-1 \
"

EXTRA_OECMAKE += " \
    -DAUTOTESTS=OFF \
    -DKAUTH_BACKEND_NAME=POLKITQT5-1 \
"
EXTRA_OECMAKE:append:class-native = " -DKAUTH_BUILD_CODEGENERATOR_ONLY=ON"
EXTRA_OECMAKE:append:class-target = " -DKAUTH_BUILD_CODEGENERATOR_ONLY=OFF"

# executables
CMAKE_ALIGN_SYSROOT[1] = "KF5Auth, -s${_IMPORT_PREFIX}/libexec/kauth/kauth-policy-gen, -s${KDE_PATH_EXTERNAL_HOST_LIBEXECS}/kauth/kauth-policy-gen"
CMAKE_ALIGN_SYSROOT:class-native[1] = "ignore"

FILES:${PN} += " \
    ${datadir}/dbus-1 \
    ${OE_QMAKE_PATH_PLUGINS} \
"

BBCLASSEXTEND = "native"
