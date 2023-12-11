import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtLocation 5.12
import QtPositioning 5.12
import com.example 1.0

Window {
    id: main_window
    width: 1024
    height: 600
    visible: true
    //visibility: Window.FullScreen
    title: qsTr("Head Unit")
    property color leftbutton_colors : "#383838"
    property color ambient_color: "#ff0000"
    property double light_width: 1.8

    ValueSource {
        id: valueSource
    }

    //center bar
    Rectangle{
        id: centerBar
        anchors {
            left: leftBar.right
            right: parent.right
            top: topBar.bottom
            bottom: parent.bottom
        }

        DBusManager {
            id: dbusHandler
        }
        
        StackLayout{
            id: centerStack
            anchors.fill: parent
            Rectangle { //centerstack : 0
                id: naviPage
                color: "blue"

                Plugin {
                    id: mapPlugin
                    name: "mapboxgl" // Mapbox plugin name
                    PluginParameter { name: "mapbox.access_token"; value: "file:/home/seame-workstation07/QT/Examples/Qt-5.15.2/quickcontrols/extras/dashboard_new/qml/mapbox/api-key.txt" }
                }
                // Map 요소를 사용하여 지도 표시
                Map {
                    id: map
                    anchors.fill: parent
                    plugin: mapPlugin
                    center: positionSource.position.coordinate //valueSource.lati, valueSource.longi
                    zoomLevel: 18
                    tilt:85                 //기울기

                    // 사용자의 현재 위치를 추적하는 PositionSource
                    PositionSource {
                        id: positionSource
                        active: true
                        updateInterval: 1000
                        onPositionChanged: {
                            map.center = position.coordinate
                        }
                    }
                    MapQuickItem {
                        id: arrow
                        coordinate: positionSource.position.coordinate
                        anchorPoint.x: arrowImage.width / 2
                        anchorPoint.y: arrowImage.height / 2
                        sourceItem: Image {
                            id: arrowImage
                            source: "qrc:/image/arrow_grey.png" // 화살표 이미지 경로
                        }
                    }
//                    // 사용자의 현재 위치를 표시하는 MapCircle
//                    MapCircle {
//                        id: circle
//                        center: positionSource.position.coordinate
//                        radius: 100
//                        color: 'blue'
//                        opacity: 0.5
//                    }
                }

//                Map {
//                    id: map
//                    anchors.fill: parent
//                    plugin: mapPlugin
//                    center: QtPositioning.coordinate(valueSource.lati, valueSource.longi) //valueSource.lati, valueSource.longi
//                    zoomLevel: 18
//                tilt:85
//                activeMapType: map.supportedMapTypes[0]
//                }



                //feature : 1. map 2. destination 3. favorite
                //when goes to naviPage refresh map with current position and possible change map position by touch
                //when compass icon touched go to current Position
            }
            Musicpage{
            }
            Camerapage{
            }
            Settingpage{
            }
            Lightpage{
            }
        }
    }

    //top bar
    Rectangle {
        //left top there is house icon & right top there is current time
        id: topBar
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
                leftMargin: 36
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
                rightMargin: 20
                verticalCenter: parent.verticalCenter
            }
            text: Qt.formatDateTime(new Date(), "hh:mm")
            color: "white"
            font.pixelSize: 25
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

    //left bar
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
                    color: leftbutton_colors  // Change this color for your button background color
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
                Rectangle {
                    id:naviButton_light
                    visible: true
                    anchors.top: parent.bottom
                    anchors.left: parent.left
                    width: parent.width
                    height: light_width // 선 두께
                    color: ambient_color
                    Behavior on color {
                        ColorAnimation {
                            duration: 500 // 애니메이션 지속 시간 (밀리초)
                        }
                    }
                }
                MouseArea {
                    id: navimouseArea
                    anchors.fill: parent
                    onClicked: {
                        centerStack.currentIndex = 0;
                    }
                }
            }

            Button {
                id: musicButton
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    color: leftbutton_colors  // Change this color for your button background color
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
                Rectangle {
                    id:musicButton_light
                    visible: true
                    anchors.top: parent.bottom
                    anchors.left: parent.left
                    width: parent.width
                    height: light_width // 선 두께
                    color: ambient_color
                    Behavior on color {
                        ColorAnimation {
                            duration: 500 // 애니메이션 지속 시간 (밀리초)
                        }
                    }

                }
                MouseArea {
                    id: musicmouseArea
                    anchors.fill: parent
                    onClicked: {
                        centerStack.currentIndex = 1;
                    }
                }
            }
            Button {
                id:videoButton
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    color: leftbutton_colors  // Change this color for your button background color
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
                Rectangle {
                    id:videoButton_light
                    visible: true
                    anchors.top: parent.bottom
                    anchors.left: parent.left
                    width: parent.width
                    height: light_width // 선 두께
                    color: ambient_color
                    Behavior on color {
                        ColorAnimation {
                            duration: 500 // 애니메이션 지속 시간 (밀리초)
                        }
                    }
                }
                MouseArea {
                    id: videomouseArea
                    anchors.fill: parent
                    onClicked: {
                        centerStack.currentIndex = 2;
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
                Rectangle {
                    id:settingButton_light
                    visible: true
                    anchors.top: parent.bottom
                    anchors.left: parent.left
                    width: parent.width
                    height: light_width // 선 두께
                    color: ambient_color
                    Behavior on color {
                        ColorAnimation {
                            duration: 500 // 애니메이션 지속 시간 (밀리초)
                        }
                    }
                }
                MouseArea {
                    id: settingmouseArea
                    anchors.fill: parent
                    onClicked: {
                        centerStack.currentIndex = 3;
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
                Rectangle {
                    id:lightButton_light
                    visible: false
                    anchors.top: parent.bottom
                    anchors.left: parent.left
                    width: parent.width
                    height: light_width // 선 두께
                    color: ambient_color
                    Behavior on color {
                        ColorAnimation {
                            duration: 500 // 애니메이션 지속 시간 (밀리초)
                        }
                    }
                }
                MouseArea {
                    id: lightmouseArea
                    anchors.fill: parent
                    onClicked: {
                        centerStack.currentIndex = 4;
                    }
                }
//                OpacityAnimator on opacity {
//                    from:0; to:1
//                    duration: 500
//                    running: StackLayout.currentIndex===3
//                }
            }
        }
    }
}
