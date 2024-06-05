#!/bin/bash

image_dir="./diary/022024"

html_file="gallery.html"

echo "<!DOCTYPE html><html><head><title>Image Gallery</title></head><body>" > "$html_file"

for image in "$image_dir"/*; do
    # Check if the file is an image
    if [[ -f "$image" && $(file -b --mime-type "$image") =~ ^image/ ]]; then
        # Write the image tag to the HTML file
        echo "<img src=\"$image\" loading="lazy"\"><br>" >> "$html_file"
    fi
done

echo "</body></html>" >> "$html_file"
echo "Gallery created: $html_file"
