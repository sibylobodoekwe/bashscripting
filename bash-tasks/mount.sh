#!/bin/bash

# Check if the mount point or file system is mounted
mount_point_or_fs=$1
mount_point=$(df -h | grep -w "$mount_point_or_fs" | awk '{print $6}')

if [ -z "$mount_point" ]; then
    echo "Error: The mount point or file system '$mount_point_or_fs' is not mounted."

    # Prompt the user if they want to attempt to mount the file system
    read -p "Do you want to attempt to mount the file system '$mount_point_or_fs'? (y/n) " answer

    if [ "$answer" = 'y' ]; then
        # Attempt to mount the file system
        sudo mount "$mount_point_or_fs"

        # Check if the mount point or file system is mounted after attempting to mount it
        mount_point=$(df -h | grep -w "$mount_point_or_fs" | awk '{print $6}')

        if [ -z "$mount_point" ]; then
            echo "Error: Unable to mount the file system '$mount_point_or_fs'."
        else
            echo "Successfully mounted the file system '$mount_point_or_fs'."
            echo "Used space: $(df -h | grep -w "$mount_point_or_fs" | awk '{print $3}')"
            echo "Free space: $(df -h | grep -w "$mount_point_or_fs" | awk '{print $4}')"
        fi
    fi
else
    echo "Used space: $(df -h | grep -w "$mount_point_or_fs" | awk '{print $3}')"
    echo "Free space: $(df -h | grep -w "$mount_point_or_fs" | awk '{print $4}')"
fi