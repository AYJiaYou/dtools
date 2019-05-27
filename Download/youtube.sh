#!/usr/bin/env bash

set -e

if [[ $# -ne 2 ]]; then 
    echo "Usage: dt-download-youtube <PlaylistURL> <OutputFolder>"
    echo "Example: dt-download-youtube \"https://www.youtube.com/playlist\\?list\\=PLC5JP36mbqAHFrIaTU4fVlWeQDU7Bvz4I\" ~/Desktop/Download/"
    echo ""
    exit 0
fi

youtube-dl -o "./$2/%(title)s.%(ext)s" "$1"
echo ""
echo "DONE!"
