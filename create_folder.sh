#!/bin/bash

# Prompt user for folder name
read -p "Enter folder name: " folder_name

# List folders on the Desktop and extract only folder names
echo "Folders on Desktop:"
desktop_folders=$(ls -d ~/Desktop/*/ | xargs -n 1 basename)
echo "$desktop_folders"

# Prompt user to select a folder
read -p "Enter the folder you want to go in: " selected_folder_basename

# Check if the selected folder basename exists
selected_folder_fullpath=""
for folder in $desktop_folders; do
    if [ "$folder" = "$selected_folder_basename" ]; then
        selected_folder_fullpath="$HOME/Desktop/$folder"
        break
    fi
done

# Check if the selected folder was found
if [ -z "$selected_folder_fullpath" ]; then
    echo "Error: Selected folder does not exist."
    exit 1
fi

# Create new folder in selected folder
mkdir -p "$selected_folder_fullpath/$folder_name"

# Change directory to the newly created folder
cd "$selected_folder_fullpath/$folder_name" || exit

# Open the folder in VSCode
code .