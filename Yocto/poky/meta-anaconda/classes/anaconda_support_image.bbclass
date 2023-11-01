FEATURE_PACKAGES_anaconda-support = "packagegroup-anaconda-support"
IMAGE_FEATURES:append = " anaconda-support package-management"

# Generate filesystem images for image copy install
IMAGE_FSTYPES += "ext4"
IMAGE_FSTYPES:remove = "live"

ROOTFS_POSTPROCESS_COMMAND:append = " copy_grub_lib;"
IMAGE_POSTPROCESS_COMMAND:append = " emit_image_env;"

inherit features_check
REQUIRED_DISTRO_FEATURES = "systemd ldconfig pam"

DEPENDS += "grub grub-efi"

copy_grub_lib() {
    if [ -d ${STAGING_DIR_HOST}${libdir}/grub ]; then
        echo "Copy grub & grub-efi lib"
        mkdir -p ${IMAGE_ROOTFS}${libdir}/grub
        cp -rf ${STAGING_DIR_HOST}${libdir}/grub/* ${IMAGE_ROOTFS}${libdir}/grub
    fi
}

python emit_image_env () {
    localdata = bb.data.createCopy(d)

    # Export DISTRO for installer build
    localdata.setVarFlag("DISTRO", "unexport", "")

    dumpfile = d.expand("${TOPDIR}/installersupport_${PN}")
    with open(dumpfile , "w") as f:
        bb.data.emit_env(f, localdata, True)
}

python __anonymous () {
    if not bb.utils.contains("PACKAGE_CLASSES", "package_rpm", True, False, d):
        raise bb.parse.SkipPackage('Target build requires RPM packages to be the default in PACKAGE_CLASSES.')

    if d.getVar("VIRTUAL-RUNTIME_init_manager", True) != "systemd":
        raise bb.parse.SkipPackage('Target build requires systemd, set VIRTUAL-RUNTIME_init_manager = "systemd" in local.conf')
}
