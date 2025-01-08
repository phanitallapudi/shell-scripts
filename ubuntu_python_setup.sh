#!/bin/bash

# Update the package list
sudo apt update -y

# Install software-properties-common
sudo apt install software-properties-common -y

# Add the deadsnakes PPA for Python 3.11
sudo add-apt-repository ppa:deadsnakes/ppa -y

# Update the package list again after adding the PPA
sudo apt update -y

# Install Python 3.11
sudo apt install python3.11 -y

# Install Python 3.11 venv
sudo apt install python3.11-venv -y

# Verify the installation of Python 3.11
python3.11 --version

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Verify the installation of Python 3.11
python3 --version

# Install python3-venv if not installed
sudo apt install python3-venv -y

# Install git
sudo apt install git -y

# Install crontab
sudo apt install cron -y
sudo systemctl start cron
sudo systemctl enable cron

# Install Poetry (Python dependency manager)
curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to the PATH (modify .bashrc to make it persistent)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify the installation of Poetry
poetry --version

# (Optional) Configure Poetry to create virtual environments inside the project directory
poetry config virtualenvs.in-project true

echo "Setup complete!"
