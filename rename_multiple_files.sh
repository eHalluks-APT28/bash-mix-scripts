#!/bin/bash

# target directory
cd ~/Directory

# add what you need
counter=1

# main loop
for file in *; do

    # get the file ext
    extension="${file##*.}"

    # create new file name
    newname="React ${counter}.${extension}"

    # change the file name on the new name of file    
    mv "$file" "$newname"
    
    echo "Edited file: $file -> $newname"

    ((counter++))
done

