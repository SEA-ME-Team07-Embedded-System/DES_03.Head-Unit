DESCRIPTION = "service register for VSOME/IP service"
LICENSE = "CLOSED"

SRC_URI = "file://vsomeip.service"
inherit systemd

S = "${WORKDIR}"

SYSTEMD_SERVICE:${PN} = "vsomeip.service"
SYSTEMD_AUTO_ENABLE = "enable"

do_install() {
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 vsomeip.service ${D}${systemd_unitdir}/system

}

FILES:${PN} += "${bindir}/example/vsomeip-example/CANService \
                ${systemd_unitdir}/system/vsomeip.service"

