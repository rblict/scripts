#!/bin/bash
SOURCE="/opt/rblict/data"
DEST="/backup/rblict_$(date +%F)"
mkdir -p "$DEST"
cp -r "$SOURCE"/* "$DEST"
echo "Backup of $SOURCE completed at $DEST" 