import QtQuick 2.12
import QtMultimedia 5.12

Rectangle { // Main container
    color: "#dfe4ea"

    // Left half - Camera feed
    Rectangle {
        id: cameraFeed
        width: parent.width / 2
        height: parent.height
        color: "#dfe4ea"

        // Camera
        Camera {
            id: camera
            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        }
        VideoOutput {
            id: cameraView
            source: camera
            width: parent.height*0.7
            height: parent.height*0.5
            scale: 0.65
            anchors.centerIn: parent
            focus: visible
            MouseArea {
                anchors.fill: cameraView;
                onClicked: {
                    if (camera.active) {
                        camera.stop() // This stops the camera if it's active
                    } else {
                        camera.start() // This starts the camera if it's not active
                    }
                }
            }
        }
        Text {
            anchors.bottom: cameraView.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 5
            text: "Camera Behind View"
            font.pixelSize: 20
        }
    }

    // Right half - Visualization
    Rectangle {
        id: distanceVisualization
        width: parent.width / 2
        height: parent.height
        anchors.right: parent.right
        color: "grey"
        Image {
            id: carImage
            width: parent.width*0.4
            height: parent.width*0.7
            anchors.centerIn: parent
            source: "qrc:/image/porsche_upview.png"
//            scale: 0.1
        }
        Image {
            id: fdistanceAlertImage
            anchors.bottom: carImage.top
            anchors.topMargin: parent.height*30
            anchors.horizontalCenter: parent.horizontalCenter
            source: {
                if (valueSource.f_dis <= 10) {
                    return "qrc:/image/fdistance_alert_1.png";
                } else if (valueSource.f_dis <= 20) {
                    return "qrc:/image/fdistance_alert_2.png";
                } else if (valueSource.f_dis <= 30) {
                    return "qrc:/image/fdistance_alert_3.png";
                } else {
                    return "qrc:/image/fdistance_alert_4.png";
                }
            }
            scale: 0.5
        }

        Image {
            id: rdistanceAlertImage
            anchors.top: carImage.bottom
            anchors.bottomMargin: parent.height*30
            anchors.horizontalCenter: parent.horizontalCenter
            source: {
                if (valueSource.r_dis <= 10) {
                    return "qrc:/image/distance_alert_1.png";
                } else if (valueSource.r_dis <= 20) {
                    return "qrc:/image/distance_alert_2.png";
                } else if (valueSource.r_dis <= 30) {
                    return "qrc:/image/distance_alert_3.png";
                } else {
                    return "qrc:/image/distance_alert_4.png";
                }
            }
            scale: 0.5
        }

        Text {
            anchors.bottom: parent.bottom
            text: "Distance : " + valueSource.r_dis + "cm"
            font.pixelSize: 20
        }
    }
}
