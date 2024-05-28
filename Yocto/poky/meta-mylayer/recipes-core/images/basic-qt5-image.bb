SUMMARY = "A basic Qt5 dev image"

#inherit populate_sdk populate_sdk_qt5
    
include recipes-core/images/core-image-base.bb

IMAGE_INSTALL:append = " dashboard"
IMAGE_INSTALL:append = " compositor"
IMAGE_INSTALL:append = " light"
IMAGE_INSTALL:append = " media"
IMAGE_INSTALL:append = " pdc"
IMAGE_INSTALL:append = " setting"
IMAGE_INSTALL:append = " navi"


    
QT_BASE = " \
    qtbase \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-tools \
"

    
QT_PKGS = " \
    qtconnectivity-dev \
    qtconnectivity-mkspecs \
    qtquickcontrols \
    qtquickcontrols-qmlplugins \
    qtquickcontrols2 \
    qtquickcontrols2-dev \
    qtquickcontrols2-mkspecs \
    qtquickcontrols2-qmlplugins \
    qtdeclarative \
    qtdeclarative-dev \
    qtdeclarative-mkspecs \
    qtdeclarative-qmlplugins \
    qtgraphicaleffects \
    qtgraphicaleffects-dev \
    qtmultimedia \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    qtmultimedia-dev \
    qtmultimedia-mkspecs \
    qtmultimedia-plugins \
    qtlocation-dev \
    qtlocation-mkspecs \
    qtlocation-plugins \
    qtvirtualkeyboard \
    qtwebchannel \
    qtwebchannel-dev \
    qtwebchannel-mkspecs \
    qtwebengine \
    qtxmlpatterns \
    qtxmlpatterns-dev \
    qtxmlpatterns-mkspecs \
    qttranslations-qtxmlpatterns \
    qtwebsockets \
    qtwebsockets-dev \
    qtwebsockets-mkspecs \
    qtwayland \
"

GSTREAMER_PKGS = " \
    mesa \
    gst-devtools \
    gstreamer1.0 \
    gstreamer1.0-meta-base \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    gstreamer1.0-omx \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-python \
    gstreamer1.0-rtsp-server \
    gstreamer1.0-vaapi \
"

PIRACER_PKGS = " \
    python3-adafruit-blinka \
    python3-adafruit-circuitpython-busdevice \
    python3-adafruit-circuitpython-pca9685 \
    python3-adafruit-circuitpython-register \
    python3-adafruit-platformdetect \
    python3-adafruit-pureio \
    python3-pyserial \
    python3-pyusb \
    rpi-gpio \
    python3-typing-extensions \
    python3-adafruit-circuitpython-framebuf \
    python3-adafruit-circuitpython-ina219 \
    python3-adafruit-circuitpython-ssd1306 \
    python3-adafruit-circuitpython-typing \
    python3-adafruit-circuitpython-requests \
    python3-pyftdi \
    python3-piracer-py \
    opencv \    
"
     
IMAGE_INSTALL += " \
    ${QT_BASE} \
    ${QT_PKGS} \
    ${GSTREAMER_PKGS} \
    ${PIRACER_PKGS} \
"

     
