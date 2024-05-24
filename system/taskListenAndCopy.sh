#!/bin/bash

# Server connection settings
SERVER_USER=$1
SERVER_IP=$2
SERVER_FILE_PATH=$3
LOCAL_DESTINATION=$4

# Function to wait for the file to appear on the server
wait_for_file() {
    echo "Waiting for the file to appear on the server..."
    while true; do
        if ssh -p 2222 "$SERVER_USER@$SERVER_IP" "[ -f \"$SERVER_FILE_PATH\" ]"; then
            echo "File appeared on the server."
            break
        fi
        sleep 1
    done
}

# Wait for the file to appear
wait_for_file

# Download the file from the server to the client
echo "Downloading the file from the server to the client..."
scp -P 2222 "$SERVER_USER@$SERVER_IP:$SERVER_FILE_PATH" "$LOCAL_DESTINATION"
echo "File successfully downloaded to the client."
