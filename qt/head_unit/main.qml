import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import "ui/Musicpage"
import "ui/Videopage"

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Head Unit")


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
        StackLayout{
            id: centerStack
            anchors.fill: parent
            Rectangle { //centerstack : 0
                id: naviPage
                color: "red"

                //feature : 1. map 2. destination 3. favorite
                //when goes to naviPage refresh map with current position and possible change map position by touch
                //when compass icon touched go to current Position

            }
            Rectangle { //centerstack : 1
                id: playPage
                //feature : 1. music 2. video
                StackLayout{
                    id: playpageStack
                    anchors.fill: parent

                    Musicpage {
                        id: musicpage
                    }

                    Videopage {//videopage
                        id: videopage
                    }
                }

                ColumnLayout {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    spacing: 0

                    // Music Button
                    Button {
                        id: playMusicButton
                        Layout.preferredWidth: 70  // Adjust according to your needs
                        Layout.preferredHeight: 70  // Adjust according to your needs
                        background: Rectangle {
                            color: "#242323"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width: playMusicButton.width * 0.5
                            source: "qrc:/img/ui/assets/image/music_icon.png" // Update the path to your music icon
                            fillMode: Image.PreserveAspectFit
                        }
                        // Animation Effect
                        scale: musicbuttonmouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: musicbuttonmouseArea
                            anchors.fill: parent
                            onClicked: {
                                playpageStack.currentIndex = 0;
                                // Logic for video button
                            }
                        }
                    }
                    // Video Button
                    Button {
                        id: playVideoButton
                        Layout.preferredWidth: 70  // Adjust according to your needs
                        Layout.preferredHeight: 70  // Adjust according to your needs
                        background: Rectangle {
                            color: "#242323"  // Change this color for your button background color
                            anchors.fill: parent
                        }
                        Image {
                            anchors.centerIn: parent
                            width: playVideoButton.width * 0.5
                            source: "qrc:/img/ui/assets/image/theater_icon.png" // Update the path to your video icon
                        fillMode: Image.PreserveAspectFit
                        }
                        // Animation Effect
                        scale: videobuttonmouseArea.pressed ? 0.95 : 1.0
                        Behavior on scale {
                            PropertyAnimation {
                                duration: 100
                            }
                        }
                        MouseArea {
                            id: videobuttonmouseArea
                            anchors.fill: parent
                            onClicked: {
                                playpageStack.currentIndex = 1;
                                // Logic for video button
                            }
                        }
                    }
                }

            }
            Rectangle { //centerstack : 2
                id: videoPage
                color: "yellow"

                //feature : 1. play 2. destination 3. list
                //1. current video - play, stop, album cover, when there is not empty
                //2. previous videolist - add favorite
                //3. every video list

            }
            Rectangle { //centerstack : 3
                id: lightPage
                color: "purple"


            }
            Rectangle { //centerstack : 4
                id: settingPage
                color: "cyan"
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
                    color: "#383838"  // Change this color for your button background color
                    anchors.fill: parent
                }
                Image {
                    anchors.centerIn: parent
                    width:naviButton.width*.6
                    source: "qrc:/img/ui/assets/image/navigate_icon.png"
                    fillMode:Image.PreserveAspectFit
                }

                // Animation Effect
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
                        centerStack.currentIndex = 0;
                        // Logic for navigation button
                    }
                }
            }

            Button {
                id: playButton
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#383838"  // Change this color for your button background color
                    anchors.fill: parent
                }
                Image {
                    anchors.centerIn: parent
                    width:playButton.width*.5
                    source: "qrc:/img/ui/assets/image/playing_icon.png"
                    fillMode:Image.PreserveAspectFit
                }
                // Animation Effect
                scale: playmouseArea.pressed ? 0.95 : 1.0
                Behavior on scale {
                    PropertyAnimation {
                        duration: 100
                    }
                }
                MouseArea {
                    id: playmouseArea
                    anchors.fill: parent
                    onClicked: {
                        centerStack.currentIndex = 1;
                        // Logic for play button
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
                    source: "qrc:/img/ui/assets/image/video_icon.png"
                    fillMode:Image.PreserveAspectFit
                }
                // Animation Effect
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
                        centerStack.currentIndex = 2;
                        // Logic for video button
                    }
                }

            }

            Button {
                id:lightButton
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#383838"  // Change this color for your button background color
                    anchors.fill: parent
                }
                Image {
                    anchors.centerIn: parent
                    width:lightButton.width*.5
                    source: "qrc:/img/ui/assets/image/car_icon.png"
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
                        centerStack.currentIndex = 3;
                        // Logic for ambient lighting button
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
                    width:settingButton.width*.5
                    source: "qrc:/img/ui/assets/image/light_icon.png"
                    fillMode:Image.PreserveAspectFit
                }
                // Animation Effect
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
                        centerStack.currentIndex = 4;
                        // Logic for setting button
                    }
                }
            }
        }
    }
}
