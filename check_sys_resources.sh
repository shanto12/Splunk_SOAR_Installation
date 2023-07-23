"#!/bin/bash

# Check Operating System
os=$(cat /etc/redhat-release)
if [[ $os == *""CentOS Linux release 7.""* ]]; then
    echo ""Operating System: YES | Available: $os | Required: CentOS 7.x""
else
    echo ""Operating System: NO | Available: $os | Required: CentOS 7.x""
fi

# Check CPU Cores
cpu_cores=$(nproc)
if ((cpu_cores >= 4)); then
    echo ""CPU Cores: YES | Available: $cpu_cores cores | Required: 4 cores""
else
    echo ""CPU Cores: NO | Available: $cpu_cores cores | Required: 4 cores""
fi

# Check Memory
total_memory=$(free -m | awk '/^Mem:/{print $2}')
if ((total_memory >= 16000)); then
    echo ""Memory: YES | Available: $total_memory MB | Required: 16 GB""
else
    echo ""Memory: NO | Available: $total_memory MB | Required: 16 GB""
fi

# Check Storage
home_directory=$(df -BG /opt/phantom | awk 'END{print $4}' | sed 's/G//')
if ((home_directory >= 500)); then
    echo ""Home Directory Storage: YES | Available: $home_directory GB | Required: 500 GB""
else
    echo ""Home Directory Storage: NO | Available: $home_directory GB | Required: 500 GB""
fi

# Check Network
network=$(lspci | grep -i 'network')
if [[ $network ]]; then
    echo ""Network: YES | Available: $network | Required: 1 Gbps network interface""
else
    echo ""Network: NO | Required: 1 Gbps network interface""
fi

# Check System Utilities
if (crontab -l &> /dev/null); then
    echo ""Cron: YES | Required: Cron""
else
    echo ""Cron: NO | Required: Cron""
fi

# Check NTP
if (systemctl is-active --quiet ntp); then
    echo ""NTP: YES | Required: NTP""
else
    echo ""NTP: NO | Required: NTP""
fi
"
