#!/bin/bash
# Sovereign Vault - Core Logic

ORIGEN="${BACKUP_PATH:-/path/to/backups}"
DESTINO="${REMOTE_PATH:-gcrypt:/}"
LOGFILE="${LOG_PATH:-/path/to/upload.log}"

echo "START BACKUP: $(date)" >> "$LOGFILE"
rclone sync "$ORIGEN" "$DESTINO" -v --transfers=4 >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
    echo "STATUS: SUCCESS" >> "$LOGFILE"
else
    echo "STATUS: ERROR - Check logs" >> "$LOGFILE"
fi
