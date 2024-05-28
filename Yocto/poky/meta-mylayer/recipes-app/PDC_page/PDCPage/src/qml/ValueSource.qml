import QtQuick 2.2

//! [0]
Item {
    id: valueSource
    property real kph: 0 //speed(cm/s)
    property real rpm: 0 //piracer wheel rpm
    property real fuel: 0 //battery
    property real f_dis: 0 //distance
    property real r_dis: 0
    property real odo: 0
    property real travelableDis:0
    property real lati:52.424455
    property real longi:10.792025
    property real gear:0
    property real mode:0

    Connections{
        target: someipManager

        onRpmChanged: {
            valueSource.kph = Math.round(rpm * 0.35); // Update kph property when speed changes
            valueSource.rpm = rpm;
        }
        onFdisChanged: {
            valueSource.f_dis = fdis; // Update kph property when speed changes
        }
        onRdisChanged: {
            valueSource.r_dis = rdis; // Update kph property when speed changes
        }
        onOdoChanged: {
            //console.log("onOdoChanged")
            valueSource.odo = odo;
        }
        onLatitudeChanged: {
            //console.log("onLatitudeChanged")
            valueSource.lati += valueSource.kph/1000000;
        }
        onLongitudeChanged: {
            //console.log("onLongitudeChanged")
            valueSource.longi += valueSource.kph/10000000;
        }
    }
 }
