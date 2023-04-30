#!/bin/bash

# Set the interface name
INTERFACE="en0"

# Function to print a progress bar
print_progress_bar() {
    local progress=$1
    local total=$2
    local width=${3:-40}

    # Make sure the progress is never more than 99% to avoid issues with filled calculation
    if [ $progress -ge $total ]; then
        progress=$((total - 1))
    fi

    local filled=$((width * progress / total))
    local empty=$((width - filled))

    printf "\r["
    printf "%0.s█" $(seq 1 $filled)
    printf "%0.s " $(seq 1 $empty)
    printf "] %d%%" $((100 * progress / total))
}

while true
do
    clear
    echo "🖥  System health status:"
    echo "=========================="
    echo "🔥 CPU and memory usage:"
    top -l 1 | head -n 10 | tail -n 6
    echo ""
    echo "💽 Disk usage for /dev/disk3s5:"

    # Get disk usage information for the device /dev/disk3s5
    disk_usage_info=$(df -h | grep "^/dev/disk3s5")

    while IFS= read -r line
    do
        usage_percent_raw=$(echo $line | awk '{print $5}')
        usage_percent=$(echo $usage_percent_raw | tr -d '%')
        mount_point=$(echo $line | awk '{print $NF}')

        # Check if usage_percent is an integer
        if [[ $usage_percent =~ ^[0-9]+$ ]]; then
            echo -n "$mount_point "
            print_progress_bar $usage_percent 100
            echo
        else
            echo "Error: Invalid percentage value for $mount_point"
        fi
    done <<< "$disk_usage_info"
    echo ""

    echo "🌐 Network stats for $INTERFACE:"
    netstat -bI $INTERFACE
    sleep 22
done
