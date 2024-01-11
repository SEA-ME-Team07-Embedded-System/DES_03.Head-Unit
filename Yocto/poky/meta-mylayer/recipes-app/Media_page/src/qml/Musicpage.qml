import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtMultimedia 5.12
import QtWebEngine 1.7
import QtQuick.VirtualKeyboard 2.1

Window {
       id: playPage
       visible: true

       //playsong with index
       function playSong(index) {
           mediaPlayer.source = songsModel.get(index).source;
           songNameLabel.text = songsModel.get(index).title;
           mediaPlayer.play();
       }
       //song cover image with index
       function imageSong(index) {
           songImage.source = songsCover.get(index).source;
       }
       // Create a property to track the current song index
       property int currentSongIndex: 0

       ListModel {
           id: songsModel
           ListElement { source: "qrc:/music/ui/assets/music/Avici-The Nigths.mp3"; title: "Avici - The Nigths"}
           ListElement { source: "qrc:/music/ui/assets/music/GAYLE-ABCDEFU.mp3"; title: "GAYLE - ABCDEFU" }
           ListElement { source: "qrc:/music/ui/assets/music/Lauv-I Like Me Better.mp3"; title: "Lauv - I Like Me Better" }
           ListElement { source: "qrc:/music/ui/assets/music/Lauv-Paris In The Rain.mp3"; title: "Lauv - Paris In The Rain" }
           ListElement { source: "qrc:/music/ui/assets/music/Mina Okabe-Every Second.mp3"; title: "Mina Okabe - Every Second" }
           ListElement { source: "qrc:/music/ui/assets/music/NewJeans-ASAP.mp3"; title: "NewJeans - ASAP" }
           ListElement { source: "qrc:/music/ui/assets/music/NewJeans-ETA.mp3"; title: "NewJeans - ETA" }
           ListElement { source: "qrc:/music/ui/assets/music/NewJeans-Super Shy.mp3"; title: "NewJeans - Super Shy" }
           ListElement { source: "qrc:/music/ui/assets/music/Sam Smith-I'm not the only one.mp3"; title: "Sam Smith - I'm not the only one" }
           ListElement { source: "qrc:/music/ui/assets/music/Jungkuk-Seven.mp3"; title: "Jungkuk - Seven" }
       }
       ListModel {
           id: songsCover
           ListElement { source: "qrc:/image/The Nigths.jpeg"; title: "Avici - The Nigths"}
           ListElement { source: "qrc:/image/ABCDEFU.jpeg"; title: "GAYLE - ABCDEFU" }
           ListElement { source: "qrc:/image/I Like Me Better.jpeg"; title: "Lauv - I Like Me Better" }
           ListElement { source: "qrc:/image/Paris In The Rain.jpeg"; title: "Lauv - Paris In The Rain" }
           ListElement { source: "qrc:/image/Every Second.jpeg"; title: "Mina Okabe - Every Second" }
           ListElement { source: "qrc:/image/ASAP.jpeg"; title: "NewJeans - ASAP" }
           ListElement { source: "qrc:/image/ETA.jpeg"; title: "NewJeans - ETA" }
           ListElement { source: "qrc:/image/Super Shy.jpeg"; title: "NewJeans - Super Shy" }
           ListElement { source: "qrc:/image/Im not the only one.jpeg"; title: "Sam Smith - I'm not the only one" }
           ListElement { source: "qrc:/image/Seven.jpeg"; title: "Jungkuk - Seven" }
       }
       MediaPlayer {
           id: mediaPlayer
           source: songsModel.get(0).source  // Set the default song
       }

       ////////////////////////////////////////////////////////////MUSIC PAGE
       Rectangle{ //musicpage
           id: musicdeatil
           color: "#dfe4ea"
           anchors.fill:parent



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
                   Layout.preferredWidth: parent.height*0.65             //250 // Adjust according to your needs
                   Layout.preferredHeight: parent.height*0.65          //250  // Adjust according to your needs
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

               ////MUSIC_RIGHT
           ColumnLayout {
               anchors.top:parent.top
               anchors.topMargin: parent.height*0.1
               anchors.bottom: parent.bottom
               anchors.bottomMargin: parent.height*0.1
               anchors.left: parent.left    /*left_page_music.right*/
               anchors.leftMargin: parent.width*0.5 //left 0.35
               width: parent.width*0.45
               height:parent.height*0.8
    //               spacing: parent.height*0.15
       //        Layout.preferredWidth: parent.width*0.5
               Frame {
                   id: filesFrame
                   leftPadding: 1
                   rightPadding: 1
                   background: Rectangle {
                       color: "lightgray"
                       radius: 5
                   }
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   ListView {
                       id: filesListView
                       clip: true
                       anchors.fill: parent
                       model: songsModel
                       delegate: ItemDelegate {
                           text: model.title
                           width: filesListView.width
                           height: filesListView.height*0.15
//                           font.pixelSize: filesListView.heaight*2
                           onClicked: {
                               mediaPlayer.source = model.source;
                               songNameLabel.text = model.title;
                               mediaPlayer.play();
                               imageSong(index);
                           }
                       }
                       ScrollBar.vertical: ScrollBar {
                           parent: filesFrame
                           policy: ScrollBar.AlwaysOn
                           anchors.top: parent.top
                           anchors.topMargin: filesFrame.topPadding
                           anchors.right: parent.right
                           anchors.rightMargin: 1
                           anchors.bottom: parent.bottom
                           anchors.bottomMargin: filesFrame.bottomPadding
                       }
                   }
               }
           }
       }


       ///VIDEO SCREEN/////////////////////////////////////////////////
       Rectangle {
           id:videoDetail
           anchors.fill: parent
           visible: false
           opacity:1
           color: "#dfe4ea"
           Behavior on opacity {
               NumberAnimation {
                   duration: 500  // 1초 동안 애니메이션 진행
               }
           }
           onOpacityChanged: {
               if (opacity == 0) {
                   videoDetail.visible = false;
               }
           }
           InputPanel {
               id: inputPanel
               z: 99
               width: parent.width
               anchors.bottom: parent.bottom
               visible: Qt.inputMethod.visible  // Important modification
           }
           Rectangle {
               id: videopage
               width: parent.width
               height: parent.height
               anchors.fill:parent
               color: "#dfe4ea"
               TextField {
                   id: searchField
                   width: parent.width - searchButton.width-parent.height*0.25
                   anchors.top: parent.top
                   anchors.left: parent.left
                   anchors.leftMargin: parent.height*0.25
                   placeholderText: "Search for a YouTube video..."
                   focus: true
                   onActiveFocusChanged: {
                       if (activeFocus) {
                           inputPanel.open(searchField)
                       }
                   }
               }
               Button {
                   id: searchButton
                   width: parent.width*0.14
                   text: "Search"
                   anchors.top: searchField.top
                   anchors.left: searchField.right
                   anchors.leftMargin: 10
                   onClicked: {
                       webView.url = "https://www.youtube.com/results?search_query=" + encodeURIComponent(searchField.text);
                       searchField.focus = false; // Hide the keyboard when searching
                   }
               }
               WebEngineView {
                   id: webView
                   anchors.top: searchField.bottom
                   anchors.topMargin: 10
                   anchors.bottom: parent.bottom
                   anchors.left: parent.left
                   anchors.right: parent.right
                   url: ""
               }
           }
       }

       ////////////////////////Button
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
                       videoDetail.opacity=0
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
                       if (videoDetail.visible==false){
                           videoDetail.visible=true
                           videoDetail.opacity=1
                       }
                       else{
                           videoDetail.opacity=0
                       }
                   }
               }
           }
       }

}
