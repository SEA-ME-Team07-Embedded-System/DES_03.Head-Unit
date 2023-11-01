DESCRIPTION = "An image with Anaconda to do installation."

LICENSE = "MIT"

# Support installation from initrd boot
do_image_complete[depends] += "${PN}-initramfs:do_image_complete"

DEPENDS += "isomd5sum-native \
"

CUSTOMIZE_LOGOS ??= "yocto-compat-logos"

# We override what gets set in core-image.bbclass
IMAGE_INSTALL = "\
    packagegroup-core-boot \
    packagegroup-core-ssh-openssh \
    ${@['', 'packagegroup-installer-x11-anaconda'][bool(d.getVar('XSERVER', True))]} \
    python3-anaconda \
    anaconda-init \
    kernel-modules \
    ${CUSTOMIZE_LOGOS} \
    dhcpcd \
    ldd \
    rng-tools \
    "
IMAGE_LINGUAS = "en-us en-gb"

# Generate live image
IMAGE_FSTYPES:remove = "live wic wic.bmap"
IMAGE_FSTYPES:append = " iso"

IMAGE_ROOTFS_EXTRA_SPACE =" + 102400"

inherit core-image anaconda_image
