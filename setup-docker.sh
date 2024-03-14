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
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Downloading the latest version of Dockerfile
curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/main/Dockerfile -o Dockerfile

# Stopping and removing existing Docker containers and images
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -a -q) -f
sudo docker volume rm $(sudo docker volume ls -q)
sudo docker network rm $(sudo docker network ls -q)
sudo docker-compose down

# Building the Docker image
sudo docker build -t moodle:4-php8 .

# Downloading the latest version of Docker Compose YAML file
curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/main/docker-compose.yml -o docker-compose.yml

# Running Docker Compose
sudo docker-compose up -d

# Accessing the container and running Certbot
sudo docker exec -it ubuntu-moodle-1 bash &&
sudo certbot --apache

# Script end