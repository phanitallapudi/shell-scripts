#!/bin/bash

# Update the package list
sudo apt update -y

# Install software-properties-common
sudo apt install software-properties-common -y

# Add the deadsnakes PPA for Python 3.11
sudo add-apt-repository ppa:deadsnakes/ppa -y

# Update the package list again after adding the PPA
sudo apt update -y

# Install Python 3.11 and venv
sudo apt install python3.11 python3.11-venv -y

# Set Python 3.11 as default
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
sudo update-alternatives --config python3

# Verify installation
python3 --version

# Install git
sudo apt install git -y

# Install crontab
sudo apt install cron -y
sudo systemctl start cron
sudo systemctl enable cron

echo "Setup complete!"
