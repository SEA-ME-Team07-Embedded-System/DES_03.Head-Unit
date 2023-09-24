import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtMultimedia 5.9

Rectangle{ //musicpage
    id: musicpage
    color: "#dfe4ea"

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

//    ListModel {
//        id: songsModel
//        ListElement { source: "qrc:/music/ui/assets/music/Avici-The Nigths.mp3"; title: "Avici - The Nigths"}
//        ListElement { source: "qrc:/music/ui/assets/music/GAYLE-ABCDEFU.mp3"; title: "GAYLE - ABCDEFU" }
//        ListElement { source: "qrc:/music/ui/assets/music/Lauv-I Like Me Better.mp3"; title: "Lauv - I Like Me Better" }
//        ListElement { source: "qrc:/music/ui/assets/music/Lauv-Paris In The Rain.mp3"; title: "Lauv - Paris In The Rain" }
//        ListElement { source: "qrc:/music/ui/assets/music/Mina Okabe-Every Second.mp3"; title: "Mina Okabe - Every Second" }
//        ListElement { source: "qrc:/music/ui/assets/music/NewJeans-ASAP.mp3"; title: "NewJeans - ASAP" }
//        ListElement { source: "qrc:/music/ui/assets/music/NewJeans-ETA.mp3"; title: "NewJeans - ETA" }
//        ListElement { source: "qrc:/music/ui/assets/music/NewJeans-Super Shy.mp3"; title: "NewJeans - Super Shy" }
//        ListElement { source: "qrc:/music/ui/assets/music/Sam Smith-I'm not the only one.mp3"; title: "Sam Smith - I'm not the only one" }
//        ListElement { source: "qrc:/music/ui/assets/music/Jungkuk-Seven.mp3"; title: "Jungkuk - Seven" }
//    }

    ListModel {
        id: songsModel
        ListElement { source: "qrc:/img/ui/assets/image/The Nigths.jpeg"; title: "Avici - The Nigths"}
        ListElement { source: "qrc:/img/ui/assets/image/ABCDEFU.jpeg"; title: "GAYLE - ABCDEFU" }
        ListElement { source: "qrc:/img/ui/assets/image/I Like Me Better.jpeg"; title: "Lauv - I Like Me Better" }
        ListElement { source: "qrc:/img/ui/assets/image/Paris In The Rain.jpeg"; title: "Lauv - Paris In The Rain" }
        ListElement { source: "qrc:/img/ui/assets/image/Every Second.jpeg"; title: "Mina Okabe - Every Second" }
        ListElement { source: "qrc:/img/ui/assets/image/ASAP.jpeg"; title: "NewJeans - ASAP" }
        ListElement { source: "qrc:/img/ui/assets/image/ETA.jpeg"; title: "NewJeans - ETA" }
        ListElement { source: "qrc:/img/ui/assets/image/Super Shy.jpeg"; title: "NewJeans - Super Shy" }
        ListElement { source: "qrc:/img/ui/assets/image/Im not the only one.jpeg"; title: "Sam Smith - I'm not the only one" }
        ListElement { source: "qrc:/img/ui/assets/image/Seven.jpeg"; title: "Jungkuk - Seven" }
    }

    ListModel {
        id: songsCover
        ListElement { source: "qrc:/img/ui/assets/image/The Nigths.jpeg"; title: "Avici - The Nigths"}
        ListElement { source: "qrc:/img/ui/assets/image/ABCDEFU.jpeg"; title: "GAYLE - ABCDEFU" }
        ListElement { source: "qrc:/img/ui/assets/image/I Like Me Better.jpeg"; title: "Lauv - I Like Me Better" }
        ListElement { source: "qrc:/img/ui/assets/image/Paris In The Rain.jpeg"; title: "Lauv - Paris In The Rain" }
        ListElement { source: "qrc:/img/ui/assets/image/Every Second.jpeg"; title: "Mina Okabe - Every Second" }
        ListElement { source: "qrc:/img/ui/assets/image/ASAP.jpeg"; title: "NewJeans - ASAP" }
        ListElement { source: "qrc:/img/ui/assets/image/ETA.jpeg"; title: "NewJeans - ETA" }
        ListElement { source: "qrc:/img/ui/assets/image/Super Shy.jpeg"; title: "NewJeans - Super Shy" }
        ListElement { source: "qrc:/img/ui/assets/image/Im not the only one.jpeg"; title: "Sam Smith - I'm not the only one" }
        ListElement { source: "qrc:/img/ui/assets/image/Seven.jpeg"; title: "Jungkuk - Seven" }
    }

    MediaPlayer {
        id: mediaPlayer
        source: songsModel.get(0).source  // Set the default song
    }

    RowLayout {
        spacing: 115
        anchors.fill: parent
        anchors.margins: 100

        ColumnLayout {
            spacing: 26
            Layout.preferredWidth: 100
            Layout.preferredHeight: 100

            Item {
                width: 250  // Desired width
                height: 250  // Desired height
                //Layout.fillWidth: true
                //Layout.fillHeight: true


                Image {
                    id: songImage
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: ;
                }
            }

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
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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

            RowLayout {
                spacing: 8
                Layout.alignment: Qt.AlignHCenter


                RoundButton {
                    icon.name: "stop!"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/stop_icon.png"
                    onClicked: {
                        mediaPlayer.stop();
                        songNameLabel.text = "";
                        songImage.source = "";
                    }
                }
                RoundButton {
                    icon.name: "previous!"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/previous_icon.png"
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
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/pause_icon.png"
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
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/next_icon.png"
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
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/shuffle_icon.png"
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
        }


        ColumnLayout {
            spacing: 16
            Layout.preferredWidth: 230


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

}
