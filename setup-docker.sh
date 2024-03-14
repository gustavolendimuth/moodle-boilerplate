#!/bin/bash

# Updating package lists
sudo apt-get update

# Upgrading installed packages
sudo apt-get upgrade -y

# Installing necessary packages for Docker installation
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adding Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adding Docker's repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Updating package lists after adding new repository
sudo apt-get update

# Installing Docker Community Edition
sudo apt-get install -y docker-ce

# Downloading the latest version of Docker Compose and making it executable
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Script end