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
cd someip/vcan
./vcan.sh &
child_pids+=($!)
./can_sender1 &
child_pids+=($!)
./can_sender2 &
child_pids+=($!)

# Navigate to the third directory and execute the program in the background
cd ../..
cd infotainment/can-interface/build
./CANService &
child_pids+=($!)
cd ../../
cd piracer-interface/build
./PiracerService_test &
child_pids+=($!)



# Optionally, wait for all background jobs to complete
wait

