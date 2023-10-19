#!/bin/bash

# List to keep track of child PIDs
child_pids=()

# Function to handle the SIGINT signal (CTRL+C)
terminate() {
    echo "Terminating child processes..."
    for pid in "${child_pids[@]}"; do
        kill -9 "$pid"
    done
    exit 1
}

# Trap the SIGINT signal and call the terminate function
trap 'terminate' SIGINT

# Navigate to the first directory and execute the programs in the background
cd /home/seame-workstation05/Desktop/DES03_HeadUnit/someip/vcan
./vcan.sh &
child_pids+=($!)
./can_sender &
child_pids+=($!)

# Navigate to the second directory and execute the program in the background
cd /home/seame-workstation05/Desktop/DES03_HeadUnit/infotainment
python3 dbus_qt_send.py &
child_pids+=($!)

# Navigate to the third directory and execute the program in the background
cd /home/seame-workstation05/Desktop/DES03_HeadUnit/infotainment/project-pyracer/build
./CANService &
child_pids+=($!)

# Optionally, wait for all background jobs to complete
wait

