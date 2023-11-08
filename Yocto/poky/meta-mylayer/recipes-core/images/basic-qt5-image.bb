inherit populate_sdk populate_sdk_qt5

SUMMARY = "A basic Qt5 dev image"
    
include recipes-core/images/core-image-base.bb

IMAGE_INSTALL:append = " dashboard"
IMAGE_INSTALL:append = " headunit"
  
    
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
"
     
IMAGE_INSTALL += " \
    ${QT_BASE} \
    ${QT_PKGS} \
"

     
