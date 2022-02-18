#!/bin/bash

# install docker
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt install docker-ce -y

# run docker application on instance
docker login --username=${docker_username} --password=${docker_password}
sudo docker pull a0morshna/cat-app:latest
sudo docker run -d -p 5000:5000 a0morshna/cat-app:latest
