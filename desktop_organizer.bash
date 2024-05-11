#!/bin/bash

SOURCE_DIR="/path/to/source"
DESTINATION_DIR="/path/to/destination"

# Move files based on their extension
for file in $SOURCE_DIR/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        mkdir -p "$DESTINATION_DIR/$extension"
        mv "$file" "$DESTINATION_DIR/$extension/"
        echo "Moved: $file to $DESTINATION_DIR/$extension/"
    fi
done
