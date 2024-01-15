import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtLocation 5.12
import QtPositioning 5.12

Window {
    visible: true
    
    ValueSource {
        id: valueSource
    }

    id: naviPage
    color: "red"
    Plugin {
        id: mapPlugin
        name: "mapboxgl" // Mapbox plugin name
        PluginParameter { name: "mapbox.access_token"; value: "/home/seame-workstation07/daekyung/DES_03.Head-Unit/Yocto/poky/meta-mylayer/recipes-app/Navigation_page/files/src/qml/mapbox/api-key.txt" }
    }
    Map{
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: positionSource.position.coordinate //valueSource.lati, valueSource.longi
        zoomLevel: 18
        tilt:85                 //기울기

        // 사용자의 현재 위치를 추적하는 PositionSource
        PositionSource {
            id: positionSource
            active: true
            updateInterval: 1000
            onPositionChanged: {
                map.center = position.coordinate
            }
        }
        MapQuickItem {
            id: arrow
            coordinate: positionSource.position.coordinate
            anchorPoint.x: arrowImage.width / 2
            anchorPoint.y: arrowImage.height / 2
            sourceItem: Image {
                id: arrowImage
                source: "qrc:/image/arrow_grey.png" // 화살표 이미지 경로
            }
        }
    }

//    Image{
//        id:arrow
//        anchors.horizontalCenter: parent.horizontalCenter
//        y: parent.height*0.5
//        width: parent.height*0.1
//        height: arrow.width
//        rotation:180
//        source:"qrc:/image/arrow_grey.png"
//    }
    
}
