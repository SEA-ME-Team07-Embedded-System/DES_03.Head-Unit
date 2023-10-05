import QtQuick 2.0

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtLocation 5.12
import QtPositioning 5.12
import QtGraphicalEffects 1.0

//ambient light

Rectangle { //centerstack : 4
    id: lightPage
    color: "cyan"
    visible: false
    Image{
        id:light_background
        anchors.centerIn: parent
        source:"qrc:/image/porsche_emblem.jpg"
        fillMode:Image.Stretch
        visible:true
        opacity:1
        Behavior on opacity {
            NumberAnimation {
                duration: 500  // 1초 동안 애니메이션 진행
            }
        }
        onOpacityChanged: {
            if (opacity == 0) {
                gear_background.visible = false;
            }
        }
    }
    Rectangle{
        color: "black"
        opacity: 0.3
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }
    Rectangle{
        anchors.centerIn: ambientbutton_detail
        width: ambientbutton_detail.width+4
        height: ambientbutton_detail.height+4
        color: "transparent"
        border.color: "white"
        border.width: 2
    }
    ColumnLayout {
        id:ambientbutton_detail
        visible: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
//                    x:500
        spacing: 1//
        opacity:0.9
        width:400
        Behavior on opacity {
            NumberAnimation {
                duration: 500  // 1초 동안 애니메이션 진행
            }
        }
        onOpacityChanged: {
            if (opacity == 0) {
                modebutton_detail.visible = false;
            }
        }

        // RED
        Button {
            id: ambientlight_red
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: 70  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"RED MODE"
                color: "white"
                font.pointSize: parent.width*0.045
                anchors.centerIn:parent
            }
            // Animation Effect
//                        scale: red_Area.pressed ? 0.95 : 1.0
//                        Behavior on scale {
//                            PropertyAnimation {
//                                duration: 100
//                            }
//                        }
            MouseArea {
                id: red_Area
                anchors.fill: parent
                onClicked: {
                    redmode_light_l.visible=true
                    redmode_light_r.visible=true
                    redmode_light_l.opacity=1
                    redmode_light_r.opacity=1
                    bluemode_light_l.opacity=0
                    bluemode_light_r.opacity=0
                    greenmode_light_l.opacity=0
                    greenmode_light_r.opacity=0
                    whitemode_light_l.opacity=0
                    whitemode_light_r.opacity=0
                }
            }
            Rectangle {
                id:redmode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "red"
                opacity:1
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        redmode_light_l.visible = false;
                    }
                }
            }
            Rectangle {
                id:redmode_light_r
                visible: false
                anchors.left : parent.right
                height: parent.height // 선 두께
                width: 2
                color: "red"
                opacity:1
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        redmode_light_r.visible = false;
                    }
                }
            }
        }

//                    // blue Button
        Button {
            id: ambientlight_blue
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: 70  // Adjust according to your needs
            background: Rectangle {
            color: "#6e6e75"  // Change this color for your button background color
            anchors.fill: parent
            }
            Text{
                text:"BLUE MODE"
                color: "white"
                font.pointSize: parent.width*0.045
                anchors.centerIn:parent
            }
            MouseArea {
                id: blue_Area
                anchors.fill: parent
                onClicked: {
                    redmode_light_l.opacity=0
                    redmode_light_r.opacity=0
                    bluemode_light_l.visible=true
                    bluemode_light_r.visible=true
                    bluemode_light_l.opacity=1
                    bluemode_light_r.opacity=1
                    greenmode_light_l.opacity=0
                    greenmode_light_r.opacity=0
                    whitemode_light_l.opacity=0
                    whitemode_light_r.opacity=0
                }
            }
            Rectangle {
                id:bluemode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "red"
                opacity:1
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        bluemode_light_l.visible = false;
                    }
                }
            }
            Rectangle {
                id:bluemode_light_r
                visible: false
                anchors.left : parent.right
                height: parent.height // 선 두께
                width: 2
                color: "red"
                opacity:1
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        bluemode_light_r.visible = false;
                    }
                }
            }
        }

////                    // green
        Button {
            id: ambientlight_green
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: 70  // Adjust according to your needs
            background: Rectangle {
            color: "#6e6e75"  // Change this color for your button background color
            anchors.fill: parent
            }
            Text{
                text:"GREEN MODE"
                color: "white"
                font.pointSize: parent.width*0.045
                anchors.centerIn:parent
            }
            MouseArea {
                id: green_Area
                anchors.fill: parent
                onClicked: {
                    redmode_light_l.opacity=0
                    redmode_light_r.opacity=0
                    bluemode_light_l.opacity=0
                    bluemode_light_r.opacity=0
                    greenmode_light_l.visible=true
                    greenmode_light_r.visible=true
                    greenmode_light_l.opacity=1
                    greenmode_light_r.opacity=1
                    whitemode_light_l.opacity=0
                    whitemode_light_r.opacity=0
                }
            }
            Rectangle {
                id:greenmode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "red"
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        greenmode_light_l.visible = false;
                    }
                }
            }
            Rectangle {
                id:greenmode_light_r
                visible: false
                anchors.left : parent.right
                height: parent.height // 선 두께
                width: 2
                color: "red"
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        greenmode_light_r.visible = false;
                    }
                }
            }
        }
        //white
        Button {
            id: ambientlight_white
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: 70  // Adjust according to your needs
            background: Rectangle {
            color: "#6e6e75"  // Change this color for your button background color
            anchors.fill: parent
            }
            Text{
                text:"WHITE MODE"
                color: "white"
                font.pointSize: parent.width*0.045
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: white_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: white_Area
                anchors.fill: parent
                onClicked: {
                    redmode_light_l.opacity=0
                    redmode_light_r.opacity=0
                    bluemode_light_l.opacity=0
                    bluemode_light_r.opacity=0
                    greenmode_light_l.opacity=0
                    greenmode_light_r.opacity=0
                    whitemode_light_l.visible=true
                    whitemode_light_r.visible=true
                    whitemode_light_l.opacity=1
                    whitemode_light_r.opacity=1
                }
            }
            Rectangle {
                id:whitemode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "red"
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        whitemode_light_l.visible = false;
                    }
                }
            }
            Rectangle {
                id:whitemode_light_r
                visible: false
                anchors.left: parent.right
                height: parent.height // 선 두께
                width: 2
                color: "red"
                Behavior on opacity {
                    NumberAnimation {
                        duration: 500  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        whitemode_light_r.visible = false;
                    }
                }
            }
        }
    }
}
