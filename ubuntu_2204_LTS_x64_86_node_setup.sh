#!/bin/bash

# Update package index
sudo apt update

# Install dependencies
sudo apt install -y curl gnupg2 lsb-release ca-certificates build-essential

# Add NodeSource repository for Node.js 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Install Node.js
sudo apt install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Verify Node.js and PM2 installation
node -v
npm -v
pm2 -v

# Enable PM2 to start on boot
sudo pm2 startup systemd -u $(whoami) --hp $(eval echo ~$USER)

# Save PM2 process list and environment
pm2 save

echo "Node.js, npm, and PM2 have been installed successfully!"
