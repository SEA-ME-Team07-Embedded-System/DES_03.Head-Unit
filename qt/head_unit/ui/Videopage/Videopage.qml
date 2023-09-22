import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

Rectangle{ //videopage
    id: videopage
    color: "#dfe4ea"

    //playsong with index
    function playVideo(index) {
        mediaPlayer.source = videosModel.get(index).source;
        videoNameLabel.text = videosModel.get(index).title;
        mediaPlayer.play();
    }

    //song cover image with index
    function imageVideo(index) {
        videoImage.source = videosCover.get(index).source;
    }

    // Create a property to track the current song index
    property int currentVideoIndex: 0

    ListModel {
        id: videosModel
        ListElement { source: "qrc:/video/ui/assets/video/race.mp4"; title: "race.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/intersection.mp4"; title: "intersection.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/sportcar.mp4"; title: "sportcar.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/surf.mp4"; title: "surf.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/wave.mp4"; title: "wave.mp4"}
    }

    ListModel {
        id: videosCover
        ListElement { source: "qrc:/video/ui/assets/video/race.mp4"; title: "race.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/intersection.mp4"; title: "intersection.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/sportcar.mp4"; title: "sportcar.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/surf.mp4"; title: "surf.mp4"}
        ListElement { source: "qrc:/video/ui/assets/video/wave.mp4"; title: "wave.mp4"}
    }

    MediaPlayer {
        id: mediaPlayer
        source: videosModel.get(0).source  // Set the default song
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
                    id: videoImage
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: ;
                }
            }

            Item {
                id: songLabelContainer
                clip: true

                Layout.fillWidth: true
                Layout.preferredHeight: videoNameLabel.implicitHeight

                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    PauseAnimation {
                        duration: 2000
                    }
                    ParallelAnimation {
                        XAnimator {
                            target: videoNameLabel
                            from: 0
                            to: songLabelContainer.width - videoNameLabel.implicitWidth
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
                            target: videoNameLabel
                            from: songLabelContainer.width - videoNameLabel.implicitWidth
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
                    id: videoNameLabel
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
                    icon.name: "stop"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/stop.png"
                    onClicked: {
                        mediaPlayer.stop();
                        videoNameLabel.text = "";
                        videoImage.source = "";
                    }
                }
                RoundButton {
                    icon.name: "previous"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/previous.png"
                    onClicked: {
                        // Decrease currentSongIndex if it's not the first song, otherwise wrap around to the last song
                        if (currentVideoIndex > 0) {
                            currentVideoIndex--;
                        } else {
                            currentVideoIndex = videosModel.count - 1;
                        }
                        playVideo(currentVideoIndex);
                        imageVideo(currentVideoIndex);
                    }
                }
                RoundButton {
                    icon.name: "pause"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/pause.png"
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
                    icon.name: "next"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/next.png"
                    onClicked: {
                        // Increase currentSongIndex if it's not the last song, otherwise wrap around to the first song
                        if (currentVideoIndex < videosModel.count - 1) {
                            currentVideoIndex++;
                        } else {
                            currentVideoIndex = 0;
                        }
                        playVideo(currentVideoIndex);
                        imageVideo(currentVideoIndex);
                    }
                }

                RoundButton {
                    icon.name: "shuffle"
                    icon.width: 32
                    icon.height: 32
                    icon.source: "qrc:/img/ui/assets/image/shuffle.png"
                    onClicked: {
                        // Generate a random index between 0 and the number of songs minus one
                        var randomIndex;
                        do {
                            randomIndex = Math.floor(Math.random() * videosModel.count);
                        } while (randomIndex === currentVideoIndex); // this ensures a different song is chosen
                        playVideo(randomIndex);
                        imageVideo(randomIndex);
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
                    model: videosModel

                    delegate: ItemDelegate {
                        text: model.title
                        width: filesListView.width

                        onClicked: {
                            mediaPlayer.source = model.source;
                            videoNameLabel.text = model.title;
                            mediaPlayer.play();
                            imageVideo(index);
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
