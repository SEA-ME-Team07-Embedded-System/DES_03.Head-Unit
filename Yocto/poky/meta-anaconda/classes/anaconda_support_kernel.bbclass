FILESEXTRAPATHS:prepend := "${LAYER_PATH_meta-anaconda}/recipes-kernel/linux/files/:"
SRC_URI:append = " \
    file://dmthin.scc \
    file://crypt.scc \
"

KERNEL_FEATURES:append = " cfg/systemd.scc"

