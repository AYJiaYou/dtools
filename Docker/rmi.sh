#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    echo "Usage: dt-docker-rmi <Image>"
    exit 0
fi

Image=$1

ArID=(`docker ps -a | awk '{print $1}'`)
ArImage=(`docker ps -a | awk '{print $2}'`)

for i in "${!ArImage[@]}"; do
    if [[ "${ArImage[$i]}" == "$Image" ]]; then
        docker stop "${ArID[$i]}"
        docker rm -v "${ArID[$i]}"
    fi
done

docker rmi $Image
