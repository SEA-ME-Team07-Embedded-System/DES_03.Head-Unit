SYSTEMD_AUTO_ENABLE:anaconda = "disable"

do_install:append:anaconda () {
    install -d ${D}${sysconfdir}/multipath
    install -m 0644 ${WORKDIR}/multipath.conf.example \
    ${D}${sysconfdir}/multipath.conf
}

