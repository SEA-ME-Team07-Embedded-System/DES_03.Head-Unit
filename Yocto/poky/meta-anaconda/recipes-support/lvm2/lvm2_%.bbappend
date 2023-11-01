LVM2_ANACONDA = "${@bb.utils.contains('DISTRO', 'anaconda', 'lvm2_anaconda.inc', '', d)} \
                               ${@bb.utils.contains('DISTRO_FEATURES', 'anaconda-support', 'lvm2_anaconda.inc', '', d)} \
                               "

require ${LVM2_ANACONDA}
