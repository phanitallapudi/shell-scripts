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

# Install serve globally
sudo npm install -g serve

# Verify Node.js, npm, PM2, and serve installation
node -v
npm -v
pm2 -v
serve -v

# Enable PM2 to start on boot
sudo pm2 startup systemd -u $(whoami) --hp $(eval echo ~$USER)

# Save PM2 process list and environment
pm2 save

echo "Node.js, npm, PM2, and serve have been installed successfully!"

# Start the app with PM2 using serve
cd /home/sporouser/sporo-synopsis-app-organization-FE || exit
pm2 start serve --name sporo-synopsis-app-organization-FE -- -s build -l 3000

echo "App is started using PM2 and serve!"
