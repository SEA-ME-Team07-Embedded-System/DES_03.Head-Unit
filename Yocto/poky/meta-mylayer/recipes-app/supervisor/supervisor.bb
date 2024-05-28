DESCRIPTION = "set supervisor configuration files"
LICENSE = "CLOSED"

SRC_URI += "file://conf.d/ \
"

S = "${WORKDIR}"

do_install:append() {
    install -d ${D}${sysconfdir}/supervisor
    cp -r ${S}/conf.d ${D}${sysconfdir}/supervisor/
}


RDEPENDS:${PN} += " python3-setuptools"
