#!/usr/bin/env sh

while :; do 
    AVAILABLE_DISK_SPACE_GB=$(df -h / | grep '/' | awk '{ print $4; }' | sed 's/\..*//g')

    if [ "$AVAILABLE_DISK_SPACE_GB" -lt "$FREE_DISK_THRESHOLD_GB" ]; then
        echo "- $AVAILABLE_DISK_SPACE_GB GB is under $FREE_DISK_THRESHOLD_GB GB threshold - starting cleanup"
        ./cleanup.sh
        echo '- Cleanup done.'
    fi

    echo "- Sleeping for: ${CLEANUP_RATE} seconds"
    sleep "$CLEANUP_RATE"
done
