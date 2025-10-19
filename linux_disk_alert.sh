#!/bin/bash
THRESHOLD=80
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
echo "Disk usage: $USAGE%"
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "⚠️ ALERT: Disk usage above $THRESHOLD%!"
fi