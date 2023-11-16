import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle { //centerstack : 1
       id: playPage
//       anchors.fill: parent
       //feature : 1. music 2. video
       StackLayout{
           id: playpageStack
           anchors.fill: parent
           MusicDeatil {
               id: musicpage
           }
           VideoDetail{
           }
       }
       ColumnLayout {
           anchors.top: parent.top
           anchors.left: parent.left
           width:parent.height*0.15
           height: parent.height*0.3
           spacing: 1

           // Music Button
           Button {
               id: playMusicButton
               Layout.preferredWidth: parent.width         // Adjust according to your needs
               Layout.preferredHeight: parent.height*0.495  // Adjust according to your needs
               background: Rectangle {
                   color: "#242323"  // Change this color for your button background color
                   anchors.fill: parent
               }
               Image {
                   anchors.centerIn: parent
                   width: playMusicButton.width * 0.5
                   source: "qrc:/image/music_icon.png" // Update the path to your music icon
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
               Layout.preferredWidth: parent.width         // Adjust according to your needs
               Layout.preferredHeight: parent.height*0.495  // Adjust according to your needs
               background: Rectangle {
                   color: "#242323"  // Change this color for your button background color
                   anchors.fill: parent
               }


               Image {
                   anchors.centerIn: parent
                   width: playVideoButton.width * 0.5
                   source: "qrc:/image/theater_icon.png" // Update the path to your video icon
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





//Rectangle { //centerstack : 1
//    id: musicPage
//    color: "green"
//    ColumnLayout {
//        anchors.top: parent.top
//        anchors.left: parent.left
//        spacing: 0

//        // Music Button
//        Button {
//            id: playMusicButton
//            Layout.preferredWidth: 70  // Adjust according to your needs
//            Layout.preferredHeight: 70  // Adjust according to your needs
//            background: Rectangle {
//                color: "#242323"  // Change this color for your button background color
//                anchors.fill: parent
//            }
//            Image {
//                anchors.centerIn: parent
//                width: playMusicButton.width * 0.5
//                source: "qrc:/image/music_icon.png" // Update the path to your music icon
//                fillMode: Image.PreserveAspectFit
//            }
//            // Animation Effect
//            scale: musicbuttonmouseArea.pressed ? 0.95 : 1.0
//            Behavior on scale {
//                PropertyAnimation {
//                    duration: 100
//                }
//            }
//            MouseArea {
//                id: musicbuttonmouseArea
//                anchors.fill: parent
//                onClicked: {
//                    // Logic for video button
//                }
//            }
//        }
//        // Video Button
////        Button {
////            id: playVideoButton
////            Layout.preferredWidth: 70  // Adjust according to your needs
////            Layout.preferredHeight: 70  // Adjust according to your needs
////            background: Rectangle {
////                color: "#242323"  // Change this color for your button background color
////                anchors.fill: parent
////            }
////            Image {
////                anchors.centerIn: parent
////                width: playVideoButton.width * 0.5
////                source: "qrc:/image/theater_icon.png" // Update the path to your video icon
////            fillMode: Image.PreserveAspectFit
////            }
////            // Animation Effect
////            scale: videobuttonmouseArea.pressed ? 0.95 : 1.0
////            Behavior on scale {
////                PropertyAnimation {
////                    duration: 100
////                }
////            }
////            MouseArea {
////                id: videobuttonmouseArea
////                anchors.fill: parent
////                onClicked: {
////                    // Logic for video button
////                }
////            }
////        }

//    }
//    //feature : 1. play 2. destination 3. list
//    //1. current music - play, stop, album cover, when there is not empty
//    //2. previous playlist - add favorite
//    //3. every songs list
//}
