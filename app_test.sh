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

# Navigate to the third directory and execute the program in the background
cd infotainment/dashboard/build
./Dashboard &
child_pids+=($!)
cd ../..
cd head_unit/build
./Head_Unit &
child_pids+=($!)



# Optionally, wait for all background jobs to complete
wait

