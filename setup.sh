#!/bin/bash

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Start Docker service
sudo service docker start

# Install npm and Node.js
curl -fsSL  https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Run Docker Compose
docker-compose up -d

# Install PM2 globally
sudo npm install -g pm2