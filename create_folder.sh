#!/bin/bash

# Colors for styling
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

# Function to display colored text

print_color() {
    local color=$1
    shift
    echo -e "${color}$@${RESET}"
}

echo "--------------------------------------------------------------"

# Prompt user for folder name
print_color $YELLOW "Enter folder name: "
read folder_name
echo 

# List folders on the Desktop and extract only folder names
print_color $GREEN "Folders on Desktop:"
desktop_folders=$(ls -d ~/Desktop/*/ | xargs -n 1 basename)
echo "$desktop_folders"

# Prompt user to select a folder
print_color $YELLOW "Which directory would you like to create folder in? "
read selected_folder_basename

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
    print_color $RED "Error: Selected directory does not exist."
    exit 1
fi

# Create new folder in selected folder
mkdir -p "$selected_folder_fullpath/$folder_name"

# Change directory to the newly created folder
cd "$selected_folder_fullpath/$folder_name" || exit

echo
# Open the folder in VSCode
print_color $YELLOW "Do you want to open this folder in VSCode? (y/n): "
read open_in_vscode

if [ "$open_in_vscode" = "y" ]; then
    code .
fi
