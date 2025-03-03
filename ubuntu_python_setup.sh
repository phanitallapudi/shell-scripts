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

# Install Poetry using Python 3.11 explicitly
curl -sSL https://install.python-poetry.org | python3.11 -

# Add Poetry to PATH and reload shell
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# Verify Poetry installation
poetry --version

# Configure Poetry to create virtual environments inside the project directory
poetry config virtualenvs.in-project true

# Test creating a virtual environment with Python 3.11
python3 -m venv myenv
source myenv/bin/activate
echo "Python virtual environment setup successfully!"

echo "Setup complete!"
