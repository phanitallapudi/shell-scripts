#!/bin/bash

# Update the package list
sudo apt update

# Install software-properties-common
sudo apt install software-properties-common -y

# Add the deadsnakes PPA for Python 3.11
sudo add-apt-repository ppa:deadsnakes/ppa -y

# Update the package list again after adding the PPA
sudo apt update

# Install Python 3.11
sudo apt install python3.11 -y

# Verify the installation
python3.11 --version

# Install python3-venv if not installed
sudo apt install python3-venv -y

# Install git
sudo apt install git -y
