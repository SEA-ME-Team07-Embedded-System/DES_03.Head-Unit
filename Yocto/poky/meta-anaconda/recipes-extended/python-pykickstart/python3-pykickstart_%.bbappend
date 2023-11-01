FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://pykickstart-enable-root-ssh-login.patch"
