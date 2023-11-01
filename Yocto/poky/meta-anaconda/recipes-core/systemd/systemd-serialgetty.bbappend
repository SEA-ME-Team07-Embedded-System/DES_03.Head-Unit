INSTALLER_SERIAL ??= "1"
FILESEXTRAPATHS:prepend:anaconda := "${@bb.utils.contains('INSTALLER_SERIAL', '1', '${THISDIR}/files:', '', d)}"
SRC_URI:append:anaconda = " \
    ${@bb.utils.contains('INSTALLER_SERIAL', '1', 'file://serial-screen-anaconda.sh', '', d)} \
"

do_install:append:anaconda() {
	if [ "${INSTALLER_SERIAL}" = "1" ]; then
		install -d ${D}${sysconfdir}/profile.d
		install -m 644 ${WORKDIR}/serial-screen-anaconda.sh ${D}${sysconfdir}/profile.d/

		sed -i -e 's,@ROOT_HOME@,${ROOT_HOME},g' ${D}${systemd_unitdir}/system/serial-getty@.service
	fi
}
