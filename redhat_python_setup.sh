#!/bin/bash

# Update the package list
sudo dnf update -y

# Install required dependencies
sudo dnf install -y dnf-plugins-core

# Enable the EPEL (Extra Packages for Enterprise Linux) repository for additional packages
sudo dnf install -y epel-release

# Install Python 3.11 from the EPEL or another repo
sudo dnf install -y python3.11

# Install Python 3.11 venv
sudo dnf install -y python3.11-venv

# Verify the installation
python3.11 --version

# Install git
sudo dnf install -y git

# Install crontab
sudo dnf install -y cronie
sudo systemctl start crond
sudo systemctl enable crond
