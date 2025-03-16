#!/bin/bash

# Update package index
sudo apt update

# Install dependencies
sudo apt install -y curl gnupg2 lsb-release ca-certificates

# Add NodeSource repository for Node.js 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Install Node.js
sudo apt install -y nodejs

# Verify installation
node -v
npm -v
