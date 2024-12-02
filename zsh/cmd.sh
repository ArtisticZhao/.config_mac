#!/bin/bash

# convert ts files to mp4 files in the current dir.
ts2mp4() {
    for file in *.ts; do
        ffmpeg -i "$file" -c copy "${file%.*}.mp4"
    done
}

function cut_video() {
    # checkout parameters
    if [ "$#" -lt 2 ]; then
        echo "Usage: cut_video <video_path> <time_segments>"
        echo "Example:"
        echo "cut_video video.mp4 00:00:01-00:10:10 00:10:20-end"
        return 1
    fi

    # get path of video
    local video_path="$1"
    shift  # remove path from the all parameters.

    # get file name of video
    local base_name="${video_path%.*}"

    # create temporary ffmpeg list file
    local file_list_name="${base_name}_file_list.txt"
    touch "$file_list_name"
    > "$file_list_name"  # create or clean old parameter file.

    # get video duration
    echo "$video_path"
    local video_duration
    video_duration=$(ffprobe -i "$video_path" -show_entries format=duration -v quiet -of csv="p=0")
    if [ $? -ne 0 ] || [ -z "$video_duration" ]; then
        echo "Error: Unable to determine video duration"
        return 1
    fi

    video_duration=$(printf "%.0f" "$video_duration")
    # convert to readable duration string（hh:mm:ss）
    local duration_hms
    duration_hms=$(printf "%02d:%02d:%02d" $((video_duration / 3600)) $(((video_duration % 3600) / 60)) $((video_duration % 60)))

    # process segmental durations.
    local index=0
    local output_files=()
    for segment in "$@"; do
        local start_time="${segment%-*}"
        local end_time="${segment#*-}"

        # replace "end" with end time of video
        if [ "$end_time" = "end" ]; then
            end_time="$duration_hms"
        fi

        local output_segment="${base_name}_segment_${index}.mp4"

        # cutting video into segment by FFmpeg
        ffmpeg -i "$video_path" -ss "$start_time" -to "$end_time" -c copy "$output_segment" -y
        if [ $? -ne 0 ]; then
            echo "Error: Failed to process segment $segment"
            return 1
        fi

        # log segments name into file
        echo "file '$output_segment'" >> "$file_list_name"
        echo "Add: $output_segment"
        output_files+=("$output_segment")
        ((index++))
    done

    echo "G: ${output_files[@]}"

    # concatenate multiple segments into one
    if [ "${#output_files[@]}" -eq 1 ]; then
        local output_file="${base_name}_part.mp4"
        # Only one segment, skip concatenate
        mv "${output_files[@]}" "${output_file}"
        echo "${output_files[@]} ${output_file}"
        echo "Only one segment extracted. Output file: $output_file"
    else
        local output_file="${base_name}_part.mp4"
        # concatenate segments
        ffmpeg -f concat -safe 0 -i "$file_list_name" -c copy "$output_file" -y
        if [ $? -eq 0 ]; then
            echo "Concatenated video saved as $output_file"
        else
            echo "Error: Failed to concatenate segments"
            return 1
        fi

        # remove segmental files
        for file in "${output_files[@]}"; do
            rm -f "$file"
        done
    fi

    # remove temporary file
    rm -f "$file_list_name"
}
