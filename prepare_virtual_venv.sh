#!/bin/bash

# Definiowanie kolorów
RED='\033[0;31m'
NC='\033[0m' # No Color

if ! python3 -m venv --help > /dev/null 2>&1; then
    echo "Installing python3-venv..."
    sudo apt-get update
    sudo apt-get install -y python3-venv
fi

read -p "Enter a project name: " project_name
project_name=$(echo "$project_name" | xargs)

read -p "Enter the path to the project: " project_path

if [[ $project_path == "~/"* ]]; then
    project_path="${HOME}${project_path:1}"
fi

mkdir -p "$project_path"
cd "$project_path" || { echo -e "${RED}UNEXPECTED ERROR: Cannot change the directory${NC}"; exit 1; }

python3 -m venv "$project_name"

source "$project_name/bin/activate"

read -p "Do you want to install the libraries? (y/n): " install_deps
if [[ "$install_deps" == "y" ]]; then
    while true; do
        read -p "Enter the name of the library (or type 0 to finish): " package_name
        if [[ "$package_name" == "0" ]]; then
            break
        fi
        if ! pip install "$package_name"; then
            echo -e "${RED}ERROR: Installation of '$package_name' failed. Please check the name and documentation and try again${NC}"
        fi
    done
fi

pip freeze > requirements.txt

read -p "Do you want to keep the virtual environment active? (y/n): " keep_active
if [[ "$keep_active" != "y" ]]; then
    deactivate
fi

echo "The process has been completed"
