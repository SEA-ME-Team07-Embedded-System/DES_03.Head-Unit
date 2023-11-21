import QtQuick 2.2
import com.example 1.0

//! [0]
//Item {
//    id: valueSource
//    property real kph: 0 //speed(cm/s)
//    property real rpm: 0 //piracer wheel rpm
//    property real fuel: 0 //battery
//    property real f_dis: 0 //distance
//    property real r_dis: 0
//    property real odo: 0
//    property real travelableDis:0
//    property real lati:52.424455
//    property real longi:10.792025
//    property real gear:0
//    property real mode:0

//    Connections{
//        target: someipManager

//        onRpmChanged: {
//            valueSource.kph = Math.round(rpm * 0.35); // Update kph property when speed changes
//            valueSource.rpm = rpm;
//        }
//        onFdisChanged: {
//            valueSource.f_dis = fdis; // Update kph property when speed changes
//        }
//        onRdisChanged: {
//            valueSource.r_dis = rdis; // Update kph property when speed changes
//        }
//        onOdoChanged: {
//            //console.log("onOdoChanged")
//            valueSource.odo = odo;
//        }
//        onLatitudeChanged: {
//            //console.log("onLatitudeChanged")
//            valueSource.lati += valueSource.kph/1000000;
//        }
//        onLongitudeChanged: {
//            //console.log("onLongitudeChanged")
//            valueSource.longi += valueSource.kph/10000000;
//        }
//    }

//    DBusManager {
//        id: dbusmanager

//        onBatteryChanged: {
//            //console.log("onBatteryChanged")
//            valueSource.fuel = dbusmanager.getBattery() // Update kph property when speed changes
//        }
//        onTravelableDisChanged: {
//            //console.log("onTraevelChanged")
//            valueSource.travelableDis = dbusmanager.getTravelableDis()
//        }
//        onGearChanged: {
//            //console.log("onGearChanged")
//            valueSource.gear = dbusmanager.getGear()
//        }
//        onModeChanged: {
//            //console.log("onModeChanged")
//            valueSource.mode = dbusmanager.getMode()
//        }
//    }
// }


           ColumnLayout {
               id:left_page_music
               anchors.top:parent.top
               anchors.topMargin: parent.height*0.1
               anchors.bottom: parent.bottom
               anchors.bottomMargin: parent.height*0.1
               anchors.left: parent.left
               anchors.leftMargin: parent.width*0.05
               width: parent.width*0.3
               spacing: parent.height*0.03
               ////MUSIC_LEFT_01.SONG IMAGE
               Item {
                   id:songImage_Item
//
                   Layout.alignment: Qt.AlignHCenter
                   Layout.preferredWidth: parent.height*0.5             //250 // Adjust according to your needs
                   Layout.preferredHeight: parent.height*0.5          //250  // Adjust according to your needs
                   //Layout.fillWidth: true
                   //Layout.fillHeight: true
                   Image {
                       id: songImage
                       anchors.fill: parent
                       fillMode: Image.PreserveAspectCrop
                       source: "";
                   }
               }
                ////MUSIC_LEFT_02.TITLE
               Item {
                   id: songLabelContainer
                   clip: true
                   Layout.fillWidth: true
                   Layout.preferredHeight: songNameLabel.implicitHeight
                   SequentialAnimation {
                       running: true
                       loops: Animation.Infinite
                       PauseAnimation {
                           duration: 2000
                       }
                       ParallelAnimation {
                           XAnimator {
                               target: songNameLabel
                               from: 0
                               to: songLabelContainer.width - songNameLabel.implicitWidth
                               duration: 5000
                           }
                           OpacityAnimator {
                               target: leftGradient
                               from: 0
                               to: 1
                           }
                       }
                       OpacityAnimator {
                           target: rightGradient
                           from: 1
                           to: 0
                       }
                       PauseAnimation {
                           duration: 1000
                       }
                       OpacityAnimator {
                           target: rightGradient
                           from: 0
                           to: 1
                       }
                       ParallelAnimation {
                           XAnimator {
                               target: songNameLabel
                               from: songLabelContainer.width - songNameLabel.implicitWidth
                               to: 0
                               duration: 5000
                           }
                           OpacityAnimator {
                               target: leftGradient
                               from: 0
                               to: 1
                           }
                       }
                       OpacityAnimator {
                           target: leftGradient
                           from: 1
                           to: 0
                       }
                   }
                   Rectangle {
                       id: leftGradient
                       gradient: Gradient {
                           GradientStop {
                               position: 0
                               color: "#dfe4ea"
                           }
                           GradientStop {
                               position: 1
                               color: "#00dfe4ea"
                           }
                       }
                       width: height
                       height: parent.height
                       anchors.left: parent.left
                       z: 1
                       rotation: -90
                       opacity: 0
                   }
                   Label {
                       id: songNameLabel
                       text: ""
                       font.pixelSize: Qt.application.font.pixelSize * 0.8
                   }
                   Rectangle {
                       id: rightGradient
                       gradient: Gradient {
                           GradientStop {
                               position: 0
                               color: "#00dfe4ea"
                           }
                           GradientStop {
                               position: 1
                               color: "#dfe4ea"
                           }
                       }
                       width: height
                       height: parent.height
                       anchors.right: parent.right
                       rotation: -90
                   }
               }
               ////MUSIC_LEFT_03.SLIDE
               Slider {
                   id: seekSlider
                   value: 113
                   to: 261
                   Layout.fillWidth: true
                   ToolTip {
                       parent: seekSlider.handle
                       visible: seekSlider.pressed
                       text: pad(Math.floor(value / 60)) + ":" + pad(Math.floor(value % 60))
                       y: parent.height
                       readonly property int value: seekSlider.valueAt(seekSlider.position)
                       function pad(number) {
                           if (number <= 9)
                               return "0" + number;
                           return number;
                       }
                   }
               }
               ////MUSIC_LEFT_04.BUTTON
               RowLayout {
                   id:buttons_Item
                   spacing: parent.height*0.04
//                   Layout.fillWidth: true
//                   Layout.preferredHeight: parent.height*0.03
                   height: parent.height*0.01
                   Layout.alignment: Qt.AlignHCenter
                   RoundButton {
                       icon.name: "stop!"
                       icon.source: "qrc:/image/stop.png"
                       icon.width: parent.height*0.6
                       icon.height: parent.height+0.4
                       onClicked: {
                           mediaPlayer.stop();
                           songNameLabel.text = "";
                           songImage.source = "";
                       }
                   }
                   RoundButton {
                       icon.name: "previous!"
                       icon.width: parent.height*0.6
//                       icon.height: parent.height+0.8
                       icon.source: "qrc:/image/previous.png"
                       onClicked: {
                           // Decrease currentSongIndex if it's not the first song, otherwise wrap around to the last song
                           if (currentSongIndex > 0) {
                               currentSongIndex--;
                           } else {
                               currentSongIndex = songsModel.count - 1;
                           }
                           playSong(currentSongIndex);
                           imageSong(currentSongIndex);
                       }
                   }
                   RoundButton {
                       icon.name: "pause!"
                       icon.width: parent.height*0.6
                       icon.source: "qrc:/image/pause.png"
                       onClicked: {
                           if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                               mediaPlayer.pause();
                           } else if (mediaPlayer.playbackState === MediaPlayer.PausedState) {
                               mediaPlayer.play();
                           }
                           // If the mediaPlayer is in StoppedState, this button won't do anything
                       }
                   }
                   RoundButton {
                       icon.name: "next!"
                       icon.width: parent.height*0.6
                       icon.source: "qrc:/image/next.png"
                       onClicked: {
                           // Increase currentSongIndex if it's not the last song, otherwise wrap around to the first song
                           if (currentSongIndex < songsModel.count - 1) {
                               currentSongIndex++;
                           } else {
                               currentSongIndex = 0;
                           }
                           playSong(currentSongIndex);
                           imageSong(currentSongIndex);
                       }
                   }
                   RoundButton {
                       icon.name: "shuffle!"
                       icon.width: parent.height*0.6
                       icon.source: "qrc:/image/shuffle.png"
                       onClicked: {
                           // Generate a random index between 0 and the number of songs minus one
                           var randomIndex;
                           do {
                               randomIndex = Math.floor(Math.random() * songsModel.count);
                           } while (randomIndex === currentSongIndex); // this ensures a different song is chosen
                           playSong(randomIndex);
                           imageSong(randomIndex);
                       }
                   }
               }
           }
