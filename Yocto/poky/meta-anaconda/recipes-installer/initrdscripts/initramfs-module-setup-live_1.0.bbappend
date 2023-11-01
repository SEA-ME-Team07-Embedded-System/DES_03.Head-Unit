FILESEXTRAPATHS:append:anaconda := ":${THISDIR}/files"

SRC_URI:append:anaconda = " \
    file://union-fs \
    file://realroot \
    file://umountfs \
"

do_install:append:anaconda() {
    install -m 0755 ${WORKDIR}/union-fs ${D}/init.d/91-union-fs
    install -m 0755 ${WORKDIR}/realroot ${D}/init.d/92-realroot
    install -m 0755 ${WORKDIR}/umountfs ${D}/init.d/93-umountfs
}

FILES:${PN}:append:anaconda = " \
    /init.d/91-union-fs \
    /init.d/92-realroot \
    /init.d/93-umountfs \
"
