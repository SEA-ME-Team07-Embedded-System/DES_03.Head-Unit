do_install:prepend:qemux86-64:anaconda () {
    if test -s ${WORKDIR}/xorg.conf; then
        sed -i 's/Modes *"640x480"/Modes    "1024x768"/g' ${WORKDIR}/xorg.conf
    fi
}

do_install:prepend:qemux86:anaconda () {
    if test -s ${WORKDIR}/xorg.conf; then
        sed -i 's/Modes *"640x480"/Modes    "1024x768"/g' ${WORKDIR}/xorg.conf
    fi
}

