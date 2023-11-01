FILESEXTRAPATHS:prepend:anaconda := "${THISDIR}/files:"
SRC_URI:append:anaconda = " file://workaround-for-anaconda-installer-while-loading-libA.patch \
"
