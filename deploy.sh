#!/bin/bash

# Function to prompt for GitHub username
prompt_username() {
    read -p "Enter your GitHub username: " username
}

# Function to prompt for GitHub password
prompt_password() {
    read -s -p "Enter your GitHub password: " password
    echo
}

# Function to clone or update the repository
clone_or_update_repo() {
    if [ -d "$local_dir" ]; then
        # Repository already exists, perform a pull
        cd "$local_dir"
        git pull
        npm install
        npm run build
        npm run migrate
        pm2 stop all
        pm2 delete all
        pm2 start dist/ --name booking-app-api
        pm2 restart 0
    else
        # Repository doesn't exist, clone it
        git clone "$repo_url" "$local_dir"
        cd "$local_dir"
        npm install
        npm run build
        npm run migrate
        pm2 stop all
        pm2 delete all
        pm2 start dist/ --name booking-app-api
        pm2 restart 0
    fi
}

# Function to perform the pull for the specified branch
perform_pull() {
#    read -p "Enter the branch name: " branch
    git pull
}

# Main script

# Set repository URL and local directory

repo_url="https://github.com/afourteia/booking-app-api.git"
local_dir="./booking-app-api"

# Prompt for GitHub username
#prompt_username

# Prompt for GitHub password
#prompt_password

# Perform GitHub login using API
# ...

# Check login status
# ...

# Clone or update the repository
clone_or_update_repo

# Perform the pull for the specified branch
#perform_pull

# Exit the script with a status of 0 (success)
exit 0