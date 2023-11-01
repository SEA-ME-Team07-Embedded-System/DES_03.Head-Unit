DESCRIPTION = "The initramfs contains anaconda installer, which supports \
PXE install (net boot installation)"

CUSTOMIZE_LOGOS ??= "yocto-compat-logos"

IMAGE_INSTALL = "\
    initramfs-live-boot \
    initramfs-live-install \
    initramfs-live-install-efi \
    busybox udev ldd \
    initscripts \
    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', '', d)} \
    sysvinit-inittab \
    base-passwd \
    kernel-modules \
    ${CUSTOMIZE_LOGOS} \
    python3-anaconda \
    anaconda-init \
    ${@['', 'packagegroup-installer-x11-anaconda'][bool(d.getVar('XSERVER', True))]} \
    packagegroup-core-boot \
    packagegroup-core-ssh-openssh \
"

IMAGE_LINGUAS = "en-us en-gb"

LICENSE = "MIT"

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
inherit core-image anaconda_image

IMAGE_ROOTFS_SIZE = "8192"
INITRAMFS_MAXSIZE ?= "1048576"

