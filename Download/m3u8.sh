#!/usr/bin/env bash

set -e

if [[ $# -ne 2 ]]; then 
    echo "Usage: dt-download-m3u8 <URL> <OutputName>"
fi

ffmpeg -i "$1" -codec copy -bsf:a aac_adtstoasc "$2"
echo ""
echo "DONE!"
