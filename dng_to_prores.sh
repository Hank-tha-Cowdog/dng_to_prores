#!/bin/bash

# Base directory containing all subdirectories
BASE_DIR="/mnt/e/CINEMATOGRAPHY/DRONE_STUFF/HUDSON_HIGHLANDS/05_AUGUST_2017/RAW/DNG/ROLL_001"

# Find and iterate through each subdirectory
find "$BASE_DIR" -mindepth 1 -maxdepth 1 -type d | while read -r SUBDIR; do
    echo "Processing directory: $SUBDIR"
    
    PNG_DIR="$SUBDIR/png"
    PRORES_DIR="$SUBDIR/prores"
    
    # Create "png" and "prores" directories if they don't exist
    mkdir -p "$PNG_DIR" "$PRORES_DIR"

    # Convert DNG images to PNG images
    for DNG_FILE in "$SUBDIR"/*.dng; do
        BASE_NAME=$(basename "${DNG_FILE%.dng}")
        PNG_FILE="$PNG_DIR/$BASE_NAME.png"
        
        # Use dcraw to convert DNG to PNG
        dcraw -c -q 3 "$DNG_FILE" | pnmtopng > "$PNG_FILE"
    done
    
    # Use ffmpeg to convert PNG sequence to ProRes
    ffmpeg -framerate 24000/1001 -pattern_type glob -i "$PNG_DIR/*.png" -s 3840x2160 -c:v prores_ks -profile:v 3 -pix_fmt yuv422p10le "$PRORES_DIR/output.mov"

    echo "Finished processing directory: $SUBDIR"
done
