SUMMARY = "Add extra Qt packages to run headunit"
 
PACKAGECONFIG:append = " \
                        eglfs \
                        fontconfig \
                        gles2 \
                        linuxfb \
                        tslib \
                        gl \
                        gles2 \
                        accessibility \
                        openssl \
                        xkbcommon \
"

DEPENDS += "userland"

