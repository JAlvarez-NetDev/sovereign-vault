#!/bin/bash
# Sovereign Vault - Core Logic
ORIGEN="/home/netmiko/Backups"
DESTINO="gcrypt:/"
LOGFILE="/home/netmiko/scripts/upload.log"

echo "START BACKUP: $(date)" >> $LOGFILE
rclone sync $ORIGEN $DESTINO -v --transfers=4 >> $LOGFILE 2>&1

if [ $? -eq 0 ]; then
    echo "STATUS: SUCCESS" >> $LOGFILE
else
    echo "STATUS: ERROR - Check logs" >> $LOGFILE
fi