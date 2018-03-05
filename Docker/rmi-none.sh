#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This command should be run as root."
    exit 1
fi

docker images | grep none | awk ' {print $3}' | xargs docker rmi
