import QtQuick 2.12

Rectangle { // Main container
    color: "#dfe4ea"

    // Left half - Camera feed
    Rectangle {
        id: cameraFeed
        width: parent.width / 2
        height: parent.height
        color: "#dfe4ea"

        Rectangle {
            id: cameraView
            width: 640  // Set to the width of the camera
            height: 480 // Set to the height of the camera
            anchors.centerIn: parent
            color: "black"
            scale : 0.65
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
            anchors.centerIn: parent
            source: "qrc:/image/porsche_upview.png"
            scale: 0.5
        }

        Image {
            id: distanceAlertImage
            
            anchors.top: carImage.top
            anchors.topMargin: 400
            anchors.horizontalCenter: parent.horizontalCenter
            source: {
                if (valueSource.temperature <= 10) {
                    return "qrc:/image/distance_alert_1.png";
                } else if (valueSource.temperature <= 20) {
                    return "qrc:/image/distance_alert_2.png";
                } else if (valueSource.temperature <= 30) {
                    return "qrc:/image/distance_alert_3.png";
                } else {
                    return "qrc:/image/distance_alert_4.png";
                }
            }
            scale: 0.5
        }

        Text {
            anchors.bottom: parent.bottom
            text: "Distance : " + valueSource.temperature + "cm"
            font.pixelSize: 20
        }
    }
}
