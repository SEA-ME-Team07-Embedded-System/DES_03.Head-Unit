FILESEXTRAPATHS:append:anaconda := ":${THISDIR}/files"

SRC_URI:append:anaconda = " \
    file://init-live.sh \
"
