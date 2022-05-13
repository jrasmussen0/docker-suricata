#!/bin/bash

ADAPTER=wlo1

# Create configuration directory if it doesn't exist
mkdir -p etc

# Create Log Directory if it doesn't exist
mkdir -p logs


podman run --rm -it --net=host \
    --name=suricata \
    --cap-add=net_admin,net_raw,sys_nice \
    -v $(pwd)/logs:/var/log/suricata \
    -v $(pwd)/etc:/etc/suricata \
    jasonish/suricata:latest -i $ADAPTER

#    --user "$(id -u):$(id -g)" \