SUMMARY = "Add extra Qt packages to run headunit"
 
PACKAGECONFIG:append = " \
                        eglfs \
                        fontconfig \
                        gles2 \
                        linuxfb \
                        tslib \
                        gl \
                        accessibility \
                        openssl \
                        xkbcommon \
"

DEPENDS += "userland"

