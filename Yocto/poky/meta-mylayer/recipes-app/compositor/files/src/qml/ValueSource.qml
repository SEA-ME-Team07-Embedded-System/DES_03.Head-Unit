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
        target: piracersomeipManager

        onBatteryChanged: {
            //console.log("onBatteryChanged")
            valueSource.fuel = battery; // Update kph property when speed changes
        }
        onGearChanged: {
            //console.log("onGearChanged")
            valueSource.gear = gear;
        }
        onModeChanged: {
            //console.log("onModeChanged")
            valueSource.mode = mode;
        }
    }
 }
