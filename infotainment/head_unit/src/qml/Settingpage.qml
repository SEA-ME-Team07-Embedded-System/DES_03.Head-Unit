import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Rectangle { //centerstack : 3
    id: settingPage
    color: "black"
    /// 1116 X 550
    Connections {
        target: valueSource
        onGearChanged: {
            console.log("onGearChanged")
            p_light.visible = false;
            r_light.visible = false;
            n_light.visible = false;
            d_light.visible = false;
            switch (valueSource.gear) {
                case 0:  // P gear
                    p_light.visible = true;
                    r_light.visible = false;
                    n_light.visible = false;
                    d_light.visible = false;
                    break;
                case 1:  // R gear
                    p_light.visible = false;
                    r_light.visible = true;
                    n_light.visible = false;
                    d_light.visible = false;
                    break;
                case 2:  // N gear
                    p_light.visible = false;
                    r_light.visible = false;
                    n_light.visible = true;
                    d_light.visible = false;
                    break;
                case 3:  // D gear
                    p_light.visible = false;
                    r_light.visible = false;
                    n_light.visible = false;
                    d_light.visible = true;
                    break;
            }
        }
        onModeChanged: {
            console.log("onModeChanged")
            switch (valueSource.mode) {
                case 9:  // Sports mode
                    sportsmode_light.visible = true;
                    normalmode_light.visible = false;
                    ecomode_light.visible = false;
                    break;
                case 5:  // Normal mode
                    sportsmode_light.visible = false;
                    normalmode_light.visible = true;
                    ecomode_light.visible = false;
                    break;
                case 3:  // Eco mode
                    sportsmode_light.visible = false;
                    normalmode_light.visible = false;
                    ecomode_light.visible = true;
                    break;
            }
        }
    }
    Image{
        id:car_image
        anchors.fill:parent
        source:"qrc:/image/caynne4.jpg"
        fillMode:Image.Stretch
    }
    Image {
        id:info_background
        anchors.fill:parent //main_window
        source: "qrc:/image/caynne3.jpg"
        fillMode:Image.Stretch//PreserveAspectFit
        visible:false
        opacity:1
        Behavior on opacity {
            NumberAnimation {
                duration: 500  // 1초 동안 애니메이션 진행
            }
        }
        onOpacityChanged: {
            if (opacity == 0) {
                info_background.visible = false;
            }
        }
    }
    Image{
        id:gear_background
        anchors.fill:parent
        source:"qrc:/image/new_cay.jpg"
        fillMode:Image.Stretch
        visible:false
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
        opacity: 0.1
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }



    ColumnLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        width:parent.height*0.15   //
        height: parent.height*0.45  // 502.2
        spacing: 1
        // CarMode Button
        Button {
            id: carmodeArea
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.33  // Adjust according to your needs
            background: Rectangle {
                color: "#242323"  // Change this color for your button background color
                anchors.fill: parent
            }
            Image {
                anchors.centerIn: parent
                width: carmodeArea.width * 0.5
                source: "qrc:/image/car.png" // Update the path to your music icon
                fillMode: Image.PreserveAspectFit
            }
            Text{
                text:"MODE"
                color: "white"
                font.pointSize: parent.width*0.13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            // Animation Effect
            scale: carmode_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            Rectangle {
                id:modebutton_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
            MouseArea {
                id: carmode_Area
                anchors.fill: parent
                onClicked: {
                    modebutton_light.visible=true
                    informationbutton_light.visible=false
                    gearbutton_light.visible=false
                    informationbutton_detail.opacity=0
                    info_background.opacity=0
                    gearbutton_detail.opacity=0
                    gear_background.opacity=0
                    if (modebutton_detail.visible==false){
                        modebutton_detail.visible=true
                        modebutton_detail.opacity=1
                    }
                    else{
                        modebutton_detail.opacity=0
                    }
                    // Logic for video button
                }
            }
        }


        // CarInformation Button
        Button {
            id: carinformationButton
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.33  // Adjust according to your needs
            background: Rectangle {
                color: "#242323"  // Change this color for your button background color
                anchors.fill: parent
            }
            Image {
                anchors.centerIn: parent
                width: carinformationButton.width * 0.5
                source: "qrc:/image/information.png" // Update the path to your video icon
            fillMode: Image.PreserveAspectFit
            }
            Text{
                text:"INFO"
                color: "white"
                font.pointSize: parent.width*0.13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }

            // Animation Effect
            scale: carinformationButton_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: carinformationButton_Area
                anchors.fill: parent
                onClicked: {
                    modebutton_light.visible=false
                    informationbutton_light.visible=true
                    gearbutton_light.visible=false
                    modebutton_detail.opacity=0
                    gear_background.opacity=0
                    gearbutton_detail.opacity=0
//                                car_image.visible=false
                    if (informationbutton_detail.visible==false){
                        informationbutton_detail.visible=true
                        informationbutton_detail.opacity=1
                        info_background.visible=true
                        info_background.opacity=1
                    }
                    else{
                        informationbutton_detail.opacity=0
//                                    informationbutton_detail.visible=false
                        info_background.opacity=0
                        info_background.visible=false
                    }
                }
            }
            Rectangle {
                id:informationbutton_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }

        // CarGear Button
        Button {
            id: caringearButton
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.33  // Adjust according to your needs
            background: Rectangle {
                color: "#242323"  // Change this color for your button background color
                anchors.fill: parent
            }
            Image {
                anchors.centerIn: parent
                width: caringearButton.width * 0.5
                source: "qrc:/image/gear.png" // Update the path to your video icon
            fillMode: Image.PreserveAspectFit
            }
            Text{
                text:"GEAR"
                color: "white"
                font.pointSize: parent.width*0.13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            Rectangle {
                id:gearbutton_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }

            // Animation Effect
            scale: caringearButton_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: caringearButton_Area
                anchors.fill: parent
                onClicked: {
                    modebutton_light.visible=false
                    informationbutton_light.visible=false
                    gearbutton_light.visible=true

                    modebutton_detail.opacity=0

                    info_background.opacity=0
                    informationbutton_detail.opacity=0

                    if (gearbutton_detail.visible==false){
                        gearbutton_detail.visible=true
                        gearbutton_detail.opacity=1
                        gear_background.visible=true
                        gear_background.opacity=1
                    }
                    else{
                        gearbutton_detail.opacity=0
                        gear_background.opacity=0
                        gear_background.visible=false
                    }


                }
            }
        }
    }

    ////////////////////////////////////////////// after mode  button click
    ColumnLayout {
        id:modebutton_detail
        visible: false
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.2
        anchors.left: parent.left
        anchors.leftMargin: parent.height*0.2 //parent.height*0.15가 button size
        width: parent.width*0.22
        height: parent.width*0.23
        spacing: 5 //
        opacity:1
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

        // CarMode Button
        Button {
            id: sportsmode
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.33  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"SPORTS MODE"
                color: "white"
                font.pointSize: parent.width*0.08
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: sportsmode_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: sportsmode_Area
                anchors.fill: parent
                onClicked: {
//                    sportsmode_light.visible=true
//                    normalmode_light.visible=false
//                    ecomode_light.visible=false
                    piracerHandler.modeSelectCall(9);
                }
            }
            Rectangle {
                id:sportsmode_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }

//                    // NORMAL Button
        Button {
            id: nomalmode
            Layout.preferredWidth: parent.width  // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.33  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"NORMAL MODE"
                color: "white"
                font.pointSize: parent.width*0.08
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: nomalmode_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: nomalmode_Area
                anchors.fill: parent
                onClicked: {
//                    sportsmode_light.visible=false
//                    normalmode_light.visible=true
//                    ecomode_light.visible=false
                    piracerHandler.modeSelectCall(5);
                }
            }
            Rectangle {
                id:normalmode_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }

//                    // ECO Button
        Button {
            id: ecomode
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.33  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.baselineOffset: 10
//                            anchors.fill: parent
            }
            Text{
                text:"ECO MODE"
                color: "white"
                font.pointSize: parent.width*0.08
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: ecomode_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: ecomode_Area
                anchors.fill: parent
                onClicked: {
//                    sportsmode_light.visible=false
//                    normalmode_light.visible=false
//                    ecomode_light.visible=true
                    piracerHandler.modeSelectCall(3);
                }
            }
            Rectangle {
                id:ecomode_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }
    }

//////////////////////////////// after info button click
    ColumnLayout {
        id:informationbutton_detail
        visible: false
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.2
        anchors.left: parent.left
        anchors.leftMargin: parent.height*0.2 //parent.height*0.15가 button size
        width: parent.width*0.22
        height: parent.width*0.3
        spacing: 5 //
        opacity:1
        Behavior on opacity {
            NumberAnimation {
                duration: 500  // 1초 동안 애니메이션 진행
            }
        }
        onOpacityChanged: {
            if (opacity == 0) {
                informationbutton_detail.visible = false;
            }
        }

        // battery detail
        Button {
            id: battery
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.25  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"BATTETRY: " + valueSource.fuel + "%"
                color: "white"
                font.pointSize: parent.width*0.06
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: battery_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: battery_Area
                anchors.fill: parent
                onClicked: {
                    battey_light.visible=true
                    rdistance_light.visible=false
                    fdistance_light.visible=false
                    temperature_light.visible=false
                }
            }
            Rectangle {
                id:battey_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }

      // Rear Distance
        Button {
            id: rdistance
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.25  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"Rear DISTANCE: " + valueSource.r_dis + " M"
                color: "white"
                font.pointSize: parent.width*0.06
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: rdistance_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: rdistance_Area
                anchors.fill: parent
                onClicked: {
                    battey_light.visible=false
                    rdistance_light.visible=true
                    fdistance_light.visible=false
                    temperature_light.visible=false
                }
            }
            Rectangle {
                id:rdistance_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }

        // front Distance
        Button {
            id: fdistance
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.25  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"Front DISTANCE: " + valueSource.f_dis + " M"
                color: "white"
                font.pointSize: parent.width*0.06
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: fdistance_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: fdistance_Area
                anchors.fill: parent
                onClicked: {
                    battey_light.visible=false
                    rdistance_light.visible=false
                    fdistance_light.visible=true
                    temperature_light.visible=false
                }
            }
            Rectangle {
                id:fdistance_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }

       // Speed
        Button {
            id: temperature
            Layout.preferredWidth: parent.width         // Adjust according to your needs
            Layout.preferredHeight: parent.height*0.25  // Adjust according to your needs
            background: Rectangle {
                color: "#6e6e75"  // Change this color for your button background color
                anchors.fill: parent
            }
            Text{
                text:"Speed: " + valueSource.kph + "CM/S"
                color: "white"
                font.pointSize: parent.width*0.06
                anchors.centerIn:parent
            }
            // Animation Effect
            scale: temperature_Area.pressed ? 0.95 : 1.0
            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }
            MouseArea {
                id: temperature_Area
                anchors.fill: parent
                onClicked: {
                    battey_light.visible=false
                    rdistance_light.visible=false
                    fdistance_light.visible=false
                    temperature_light.visible=true
                    // Logic for video button
                }
            }
            Rectangle {
                id:temperature_light
                visible: false
                anchors.top: parent.bottom
                anchors.left: parent.left
                width: parent.width
                height: 1 // 선 두께
                color: "red"
            }
        }
    }

//////////////////////////////// AFTER GEAR BUTTON CLICK
        ColumnLayout {
            id:gearbutton_detail
            visible: false
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.2
            anchors.right: parent.right
            anchors.rightMargin: parent.height*0.2 //parent.height*0.15가 button size
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.2
            width: parent.width*0.22
            height: parent.width*0.4
            spacing: parent.height*0.05//
            opacity:1
            Behavior on opacity {
                NumberAnimation {
                    duration: 500  // 1초 동안 애니메이션 진행
                }
            }
            onOpacityChanged: {
                if (opacity == 0) {
                    gearbutton_detail.visible = false;
                }
            }

            // P
            Button {
                id: gear_p
                Layout.preferredWidth: parent.height*0.2   // Adjust according to your needs
                Layout.preferredHeight: parent.height*0.2  // Adjust according to your needs
                background: Rectangle {
                    color: "transparent" //// Change this color for your button background color
                    anchors.fill: parent
                }
                // Animation Effect
                scale: p_Area.pressed ? 0.95 : 1.0
                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }
                MouseArea {
                    id: p_Area
                    anchors.fill: parent
                }
                Rectangle {
                    id:p_light
                    visible: false
                    anchors.top: parent.top
                    anchors.left: parent.left
                    width: parent.width
                    height: parent.height
                    SequentialAnimation on color {
                        ColorAnimation { from: "#aae6e6e6"; to: "#aa737373"; duration: 1500 }
                    }
//                                color: "transparent"
                    border.color: "transparent"
                    border.width: 1
                    radius: 2
                }
                Text{
                    text:"P"
                    color: "white"
                    font.pointSize: parent.width*0.9
                    anchors.centerIn:parent
                }
            }

            //R
            Button {
                id: gear_r
                Layout.preferredWidth: parent.height*0.2   // Adjust according to your needs
                Layout.preferredHeight: parent.height*0.2  // Adjust according to your needs
                background: Rectangle {
                    color: "transparent"  // Change this color for your button background color
                    anchors.fill: parent
                }
                // Animation Effect
                scale: r_Area.pressed ? 0.95 : 1.0
                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }
                MouseArea {
                    id: r_Area
                    anchors.fill: parent
                }
                Rectangle {
                    id:r_light
                    visible: false
                    anchors.top: parent.top
                    anchors.left: parent.left
                    width: parent.width
                    height: parent.height
                    SequentialAnimation on color {
                        ColorAnimation { from: "#aae6e6e6"; to: "#aa737373"; duration: 1500 }
                    }
                    border.color: "transparent"
                    border.width: 1
                    radius: 2
                }
                Text{
                    text:"R"
                    color: "white"
                    font.pointSize: parent.width*0.9
                    anchors.centerIn:parent
                }
            }

             //  N
            Button {
                id: gear_n
                Layout.preferredWidth: parent.height*0.2   // Adjust according to your needs
                Layout.preferredHeight: parent.height*0.2  // Adjust according to your needs
                background: Rectangle {
                    color: "transparent"  // Change this color for your button background color
                    anchors.fill: parent
                }
                // Animation Effect
                scale: n_Area.pressed ? 0.95 : 1.0
                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }
                MouseArea {
                    id: n_Area
                    anchors.fill: parent
                }
                Rectangle {
                    id:n_light
                    visible: false
                    anchors.top: parent.top
                    anchors.left: parent.left
                    width: parent.width
                    height: parent.height
                    SequentialAnimation on color {
                        ColorAnimation { from: "#aae6e6e6"; to: "#aa737373"; duration: 1500 }
                    }
                    border.color: "transparent"
                    border.width: 1
                    radius: 2
                }
                Text{
                    text:"N"
                    color: "white"
                    font.pointSize: parent.width*0.85
                    anchors.centerIn:parent
                }
            }
            //D
            Button {
                id: gear_d
                Layout.preferredWidth: parent.height*0.2   // Adjust according to your needs
                Layout.preferredHeight: parent.height*0.2  // Adjust according to your needs
                background: Rectangle {
                    color: "transparent"//"#6e6e75"  // Change this color for your button background color
                    anchors.fill: parent
                }
                // Animation Effect
                scale: d_Area.pressed ? 0.95 : 1.0
                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }
                MouseArea {
                    id: d_Area
                    anchors.fill: parent
                }
                Rectangle {
                    id:d_light
                    visible: false
                    anchors.top: parent.top
                    anchors.left: parent.left
                    width: parent.width
                    height: parent.height
                    SequentialAnimation on color {
                        ColorAnimation { from: "#aae6e6e6"; to: "#aa737373"; duration: 1500 }
                    }
                    border.color: "transparent"
                    border.width: 1
                    radius: 2
                }
                Text{
                    text:"D"
                    color: "white"
                    font.pointSize: parent.width*0.9
                    anchors.centerIn:parent
                }
            }
        }


    //////////////////////////
}


//    Canvas {
//        id:shadow
//        width: 900
//        height: shadow.width/7
////                    rotation: -5
//        x:-20//(1024-shadow.width)*0.01
//        y:265
//        onPaint: {
//            var ctx = getContext("2d");
//            ctx.fillStyle = "#4a4a4f";
//            ctx.strokeStyle = "#5a5d63";
//            ctx.beginPath();
//            ctx.ellipse(shadow.width/2, shadow.height/2, shadow.width/2.5, shadow.height/4, 0, 0, Math.PI * 2); // 타원을 그립니다.
//            ctx.fill();
//            ctx.stroke(); // 타원을 스트로크로 그립니다.
//        }
//        InnerShadow {
//            anchors.fill: source
//            cached: true
//            radius: shadow.height/6
//            samples: 20
//            color: "#5d5d63"
//            source: parent
//        }
//        DropShadow {
//            anchors.fill: source
//            source: parent
//            radius: shadow.height/5.5 //6//shadow.height/5.9
//            color: "#343438"
//            samples: 15
////                        cached: true
//        }
//    }
//                Image{
//                    id:car_image
//                    x:modebutton_detail.x+car_image.width/2
//                    y:parent.height/9
////                        anchors.horizontalCenter: parent.horizontalCenter
////                        anchors.centerIn: parent
//                        width: parent.height*0.9
//                        height: car_image.width*0.8
//                        source:"file:///home/daekyung/Desktop/DES_03/DES_03.Head-Unit/qt/head_unit/image/caynne.png"
//                }
