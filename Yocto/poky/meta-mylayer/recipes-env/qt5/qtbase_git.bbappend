SUMMARY = "Add extra Qt packages to run headunit"

OPENSSL_LINKING_MODE = "-linked"


 
PACKAGECONFIG:append = " \
                        eglfs \
                        fontconfig \
                        openssl \
                        gles2 \
                        linuxfb \
                        tslib \
                        gl \
                        accessibility \
"

DEPENDS += "userland"

