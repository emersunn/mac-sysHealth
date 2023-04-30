# Mac System Health Monitor

A simple bash script to monitor the system health on macOS, including CPU and memory usage, disk usage for a specific volume, and network statistics for a specific network interface.

## Features

- Displays CPU and memory usage
- Shows disk usage with a progress bar for the `/dev/disk3s5` volume
- Displays network statistics for the `en0` network interface

## Requirements

- macOS
- Bash

## Usage

1. Download or clone the repository:

```git clone https://github.com/emersunn/system-health-monitor.git```

2. Navigate to the downloaded folder:

```cd system-health-monitor```

3. Make the script executable:

```chmod +x sysHealth.sh```

4. Run the script:

```./sysHealth.sh```

The script will display the system health information and update it every 22 seconds.

To stop the script, press `Ctrl + C`.

## Customization

You can customize the script to monitor a different volume or network interface by modifying the following variables:

- `INTERFACE`: Set this to the name of the network interface you want to monitor (e.g., `en1`, `en2`, etc.).
- To change the monitored volume, update the `disk_usage_info` line with the appropriate `grep` command to filter the output for the desired volume.






