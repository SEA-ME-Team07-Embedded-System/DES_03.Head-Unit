SUMMARY = "Recipe for PiRacer Script"
LICENSE = "CLOSED"

SRC_URI = "file://piracer_test.py \
	   file://gamepad.py \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/piracer_test.py ${D}${bindir}
    install -m 0755 ${S}/gamepad.py ${D}${bindir}
}

# FILES_${PN} += "${bindir}/piracer_test.py"
