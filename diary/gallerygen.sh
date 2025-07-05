#!/bin/bash

image_dir="./20252"

html_file="newgallery.html"

echo "<!DOCTYPE html><html><head><title>Gallery Title</title></head><body>" > "$html_file"

for image in "$image_dir"/*; do
    # Check if the file is an image
    if [[ -f "$image" && $(file -b --mime-type "$image") =~ ^image/ ]]; then
        # Write the image tag to the HTML file
        echo "<img src=\"$image\" loading="lazy"\"><br><br>" >> "$html_file"
    fi
done

echo "</body></html>" >> "$html_file"
echo "Gallery created: $html_file"
