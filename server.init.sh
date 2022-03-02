#!/bin/bash

echo "Installing docker ..."
# Download Docker installation script
curl -fsSL https://get.docker.com -o get-docker.sh

# Run Docker installation script
sudo sh get-docker.sh

# Install Docker-compose
echo "Installing docker-compose ..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Verify Docker-compose Installed
echo "Verifying docker-compose ..."
sudo docker-compose --version

# Install Git
echo "Installing Git ..."
sudo apt install -y git 

# Clone the repository 
echo "Cloning the git repository ..."
git clone https://github.com/a7medayman6/Next.js-Nginx-Docker



