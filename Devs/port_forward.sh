#!/bin/bash

LOCAL_PORT=$1
REMOTE_PORT=$2
DNS=$3
PEM_KEY=$4

TCP_PID=$(lsof -i tcp:$LOCAL_PORT | awk '{print $2}' | sed -n 2p)
echo $TCP_PID
sudo kill $TCP_PID

ssh -N -f -L localhost:$LOCAL_PORT:localhost:$REMOTE_PORT ubuntu@$DNS
