import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
//ambient light

Window { //centerstack : 4
    id: lightPage
    color: "cyan"
    visible: true
    property int currentIndex: 0
    property var colorList: ["red", "green", "blue", "orange", "purple"]
    property color random_color:"red"
    Image{
        id:light_background
        anchors.fill:parent
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
        anchors.fill:parent
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
        spacing: 1//
        opacity:0.9
        width:parent.width*0.45
        height: parent.height*0.62
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
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.192  // Adjust according to your needs 245
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
                    random_light_l.opacity=0
                    random_light_r.opacity=0
                    timer.running = false;
                    ambient_color="red"
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
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.245  // Adjust according to your needs
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
                    random_light_l.opacity=0
                    random_light_r.opacity=0
                    timer.running = false;
                    ambient_color="blue"
                }
            }
            Rectangle {
                id:bluemode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "blue"
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
                color: "blue"
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
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.192  // Adjust according to your needs 245
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
                    random_light_l.opacity=0
                    random_light_r.opacity=0
                    timer.running = false;
                    ambient_color="green"
                }
            }
            Rectangle {
                id:greenmode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "green"
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
                color: "green"
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
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.245  // Adjust according to your needs
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
                    random_light_l.opacity=0
                    random_light_r.opacity=0
                    timer.running = false;
                    ambient_color="white"
                }
            }
            Rectangle {
                id:whitemode_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: "white"
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
                color: "white"
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
        Button {
            id: ambientlight_random
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.192  // Adjust according to your needs
            background: Rectangle {
            color: "#6e6e75"  // Change this color for your button background color
            anchors.fill: parent
            }
            Text{
                text:"RANDOM MODE"
                color: "white"
                font.pointSize: parent.width*0.045
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: random_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: random_Area
                anchors.fill: parent
                onClicked: {
                    redmode_light_l.opacity=0
                    redmode_light_r.opacity=0
                    bluemode_light_l.opacity=0
                    bluemode_light_r.opacity=0
                    greenmode_light_l.opacity=0
                    greenmode_light_r.opacity=0
                    whitemode_light_l.opacity=0
                    whitemode_light_r.opacity=0
                    random_light_l.visible=true
                    random_light_r.visible=true
                    random_light_l.opacity=1
                    random_light_r.opacity=1
                    timer.running=true
//                    var colors = ["red", "green", "blue", "orange", "purple"];
//                    var randomIndex = Math.floor(Math.random() * colors.length);
//                    currentColor = colors[randomIndex];
//                    random_light_l.visible=true
//                    random_light_r.visible=true
//                    random_light_l.opacity=1
//                    random_light_r.opacity=1
//                    ambient_color= colorList[currentIndex]
                }
            }
            Timer {
                id: timer
                interval: 1500 // 1초마다 색상 변경
                running: false
                repeat: true
                onTriggered: {
                    // 색상 변경
                    currentIndex = (currentIndex + 1) % colorList.length;
                    random_color = colorList[currentIndex];
                    ambient_color = random_color;
                }
            }
            Rectangle {
                id:random_light_l
                visible: false
                anchors.right: parent.left
                height: parent.height // 선 두께
                width: 2
                color: ambient_color
                Behavior on opacity {
                    NumberAnimation {
                        duration: 600  // 1초 동안 애니메이션 진행
                    }
                }
                onOpacityChanged: {
                    if (opacity == 0) {
                        whitemode_light_l.visible = false;
                    }
                }
            }
            Rectangle {
                id:random_light_r
                visible: false
                anchors.left: parent.right
                height: parent.height // 선 두께
                width: 2
                color: ambient_color
                Behavior on opacity {
                    NumberAnimation {
                        duration: 600  // 1초 동안 애니메이션 진행
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
