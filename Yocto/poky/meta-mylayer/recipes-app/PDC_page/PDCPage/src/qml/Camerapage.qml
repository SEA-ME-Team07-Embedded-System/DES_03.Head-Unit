import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Window 2.12

Window { // Main container
    color: "#dfe4ea"
    visible: true

    ValueSource {
        id: valueSource
    }

    // Left half - Camera feed
    Rectangle {
        id: cameraFeed
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width / 2
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
            scale: 0.5
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
            anchors.bottomMargin: parent.width*0.01
            text: "Camera Behind View"
            font.pixelSize: parent.width*0.05
        }
    }

    // Right half - Visualization
    Rectangle {
        id: distanceVisualization
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: cameraFeed.right
        anchors.right: parent.right
        width: parent.width / 2
        color: "grey"
        Image {
            id: carImage
            width: parent.width*0.3
            height: parent.width*0.5
            anchors.centerIn: parent
            source: "qrc:/image/porsche_upview.png"
//            scale: 0.1
        }
        Image {
            id: fdistanceAlertImage
            anchors.top: parent.top
//            anchors.topMargin: parent.height*0.001
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
            anchors.bottom: parent.bottom
//            anchors.bottomMargin: parent.height*0.001
            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
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
            id: reardistext
            anchors.bottom: parent.bottom
            text: "Rear Distance : " + valueSource.r_dis + "cm"
            font.pixelSize: parent.width*0.05
        }
        Text {
            anchors.bottom: reardistext.top
            text: "Front Distance : " + valueSource.f_dis + "cm"
            font.pixelSize: parent.width*0.05
        }
    }
}
