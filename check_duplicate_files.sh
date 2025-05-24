#!/bin/bash

dir="${1:-.}"

echo "Looking for near-duplicate files in '$dir'..."

find "$dir" -type f -print0 | while IFS= read -r -d '' file; do
    size=$(stat -c %s "$file")
    base=$(basename "$file")
    name="${base%.*}"

    #Skip already seen files (store hits in a temp file)
    grep -q "|$size|$name|" /tmp/seen_files.txt 2>/dev/null && continue

    #Find files with same size and base name (without extension)
    find "$dir" -type f -size "${size}c" -print0 | while IFS= read -r -d '' other; do
        [ "$file" = "$other" ] && continue

        other_base=$(basename "$other")
        other_name="${other_base%.*}"

        if [ "$name" = "$other_name" ]; then
            echo "Duplicate: $file <-> $other"
        fi
    done

    echo "|$size|$name|" >> /tmp/seen_files.txt
done

#Cleanup the temp dir 
rm -f /tmp/seen_files.txt
