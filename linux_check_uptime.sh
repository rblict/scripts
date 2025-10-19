#!/bin/bash
echo "===== Server Uptime Check ====="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Current Users: $(who | wc -l)"
echo "==============================" 