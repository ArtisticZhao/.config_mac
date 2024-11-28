#!/bin/bash

# convert ts files to mp4 files in the current dir.
ts2mp4() {
    for file in *.ts; do
        ffmpeg -i "$file" -c copy "${file%.*}.mp4"
    done
}
