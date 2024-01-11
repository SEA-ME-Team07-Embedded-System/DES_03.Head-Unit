import QtQuick 2.0
import QtWayland.Compositor 1.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

WaylandCompositor {
    Component {
        id: chromeComponent
        ShellSurfaceItem {
            anchors.fill: parent
            onSurfaceDestroyed: destroy()
            onWidthChanged: handleResized()
            onHeightChanged: handleResized()
            function handleResized() {
                shellSurface.sendConfigure(Qt.size(width, height));
            }
        }
    }
    IviApplication {
        id: iviApplication

        signal ambientChangeRequested()
        signal mediaChangeRequested()
        signal naviChangeRequested()
        signal pdcChangeRequested()
        signal settingChangeRequested()

        onAmbientChangeRequested: {
            console.debug("Ambient page change requested!");
            ambientScreen.visible = true;
            mediaScreen.visible = false;
            naviScreen.visible = false;
            pDCScreen.visible = false;
            settingScreen.visible = false;
        }

        onMediaChangeRequested: {
            console.debug("Media page change requested!");
            ambientScreen.visible = false;
            mediaScreen.visible = true;
            naviScreen.visible = false;
            pDCScreen.visible = false;
            settingScreen.visible = false;
        }

        onNaviChangeRequested: {
            console.debug("Navi page change requested!");
            ambientScreen.visible = false;
            mediaScreen.visible = false;
            naviScreen.visible = true;
            pDCScreen.visible = false;
            settingScreen.visible = false;
        }

        onPdcChangeRequested: {
            console.debug("PDC page change requested!");
            ambientScreen.visible = false;
            mediaScreen.visible = false;
            naviScreen.visible = false;
            pDCScreen.visible = true;
            settingScreen.visible = false;
        }

        onSettingChangeRequested:{
            console.debug("Setting page change requested!");
            ambientScreen.visible = false;
            mediaScreen.visible = false;
            naviScreen.visible = false;
            pDCScreen.visible = false;
            settingScreen.visible = true;
        }

        onIviSurfaceCreated: {

            if (iviSurface.iviId === 1330) {
                var ambient = chromeComponent.createObject(ambientScreen, { "shellSurface": iviSurface } );
                ambient.handleResized();    
            }
            if (iviSurface.iviId === 1331) {
                var media = chromeComponent.createObject(mediaScreen, { "shellSurface": iviSurface } );
                media.handleResized();    
            }
            if (iviSurface.iviId === 1332) {
                var navi = chromeComponent.createObject(naviScreen, { "shellSurface": iviSurface } );
                navi.handleResized();    
            }
            if (iviSurface.iviId === 1333) {
                var pdc = chromeComponent.createObject(pDCScreen, { "shellSurface": iviSurface } );
                pdc.handleResized();    
            }
            if (iviSurface.iviId === 1334) {
                var setting = chromeComponent.createObject(settingScreen, { "shellSurface": iviSurface } );
                setting.handleResized();    
            }
        }
    }

    WaylandOutput {
        sizeFollowsWindow: true

        ValueSource {
            id: valueSource
        }

        window: Window {
            id: main_window
            width: 1024
            height: 600
            visible: true

            Rectangle {
                id: ambientScreen
                width: parent.width / 2
                height: parent.height
                anchors {
                    left: leftBar.right
                    right: parent.right
                    top: topBar.bottom
                    bottom: parent.bottom
                }
            }
            Rectangle {
                id: mediaScreen
                width: parent.width / 2
                height: parent.height
                anchors {
                    left: leftBar.right
                    right: parent.right
                    top: topBar.bottom
                    bottom: parent.bottom
                }
            }
            Rectangle {
                id: naviScreen
                width: parent.width / 2
                height: parent.height
                anchors {
                    left: leftBar.right
                    right: parent.right
                    top: topBar.bottom
                    bottom: parent.bottom
                }
            }
            Rectangle {
                id: pDCScreen
                width: parent.width / 2
                height: parent.height
                anchors {
                    left: leftBar.right
                    right: parent.right
                    top: topBar.bottom
                    bottom: parent.bottom
                }
            }
            Rectangle {
                id: settingScreen
                width: parent.width / 2
                height: parent.height
                anchors {
                    left: leftBar.right
                    right: parent.right
                    top: topBar.bottom
                    bottom: parent.bottom
                }
            }

            Rectangle {
                id: topBar
                width: parent.width / 2
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                }
                height: parent.height / 12
                color: "#6d7485"
                Image {
                    id: house_icon
                    source: "qrc:/image/house_icon.png"
                    anchors {
                        left: parent.left
                        leftMargin: parent.height*0.7
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height*.6
                    fillMode:Image.PreserveAspectFit
                }

                // Digital Clock
                Text {
                    id: digitalClock
                    anchors {
                        right: parent.right
                        rightMargin: parent.height*0.4
                        verticalCenter: parent.verticalCenter
                    }
                    text: Qt.formatDateTime(new Date(), "hh:mm")
                    color: "white"
                    font.pixelSize: parent.height*0.5
                }
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: {
                        digitalClock.text = Qt.formatDateTime(new Date(), "hh:mm")
                    }
                }
            }


            Rectangle {
                id: leftBar
                anchors {
                    left: parent.left
                    top: topBar.bottom
                    bottom: parent.bottom
                }
                width: parent.width / 10
                color: "black"
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 3
                    Button {
                        id: naviButton
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#383838"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width:naviButton.width*.6
                            source: "qrc:/image/navigate_icon.png"
                            fillMode:Image.PreserveAspectFit
                        }
                        scale: navimouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: navimouseArea
                            anchors.fill: parent
                            onClicked: {
                                //change ivi id 1332
                                iviApplication.naviChangeRequested();
                            }
                        }
                    }

                    Button {
                        id: musicButton
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#383838"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width:musicButton.width*.5
                            source: "qrc:/image/playing_icon.png"
                            fillMode:Image.PreserveAspectFit
                        }
                        scale: musicmouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: musicmouseArea
                            anchors.fill: parent
                            onClicked: {
                                //change ivi id 1331
                                iviApplication.mediaChangeRequested();
                            }
                        }
                    }
                    Button {
                        id:videoButton
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#383838"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width:videoButton.width*.5
                            source: "qrc:/image/video_icon.png"
                            fillMode:Image.PreserveAspectFit
                        }
                        scale: videomouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: videomouseArea
                            anchors.fill: parent
                            onClicked: {
                                //change ivi id 1333
                                iviApplication.pdcChangeRequested();
                            }
                        }
                    }
                    Button {
                        id:settingButton
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#383838"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width:parent.width*.5
                            source: "qrc:/image/car.png"   //car_icon.png
                            fillMode:Image.PreserveAspectFit
                        }
                        scale: settingmouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: settingmouseArea
                            anchors.fill: parent
                            onClicked: {
                                //change ivi id 1334
                                iviApplication.settingChangeRequested();
                            }
                        }
                    }

                    Button {
                        id: lightButton
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#383838"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width:parent.width*.5
                            source: "qrc:/image/light_icon.png"
                            fillMode:Image.PreserveAspectFit
                        }
                        // Animation Effect
                        scale: lightmouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: lightmouseArea
                            anchors.fill: parent
                            onClicked: {
                                //change ivi id 1330
                                iviApplication.ambientChangeRequested();
                            }
                        }
                    }
                }
            }
        }
    }
}
