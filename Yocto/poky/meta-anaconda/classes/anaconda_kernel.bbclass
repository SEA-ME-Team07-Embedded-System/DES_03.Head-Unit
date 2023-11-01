FILESEXTRAPATHS:prepend := "${LAYER_PATH_meta-anaconda}/recipes-kernel/linux/files/:"
SRC_URI:append = " \
    file://dmthin.scc \
    file://crypt.scc \
    file://liveinstall.scc \
    file://efivarfs.scc \
    file://multipath.scc \
    file://ide.scc \
"

KERNEL_FEATURES:append = " \
    features/overlayfs/overlayfs.scc \
    cfg/systemd.scc \
"
