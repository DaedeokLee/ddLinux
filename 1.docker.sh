sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y linux-image-extra-4.4.0–59-generic linux-image-extra-virtual
sudo apt-get install -y \
 apt-transport-https \
 ca-certificates \
 curl \
 software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
 “deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable”
sudo apt-get update
sudo apt-get install -y docker-ce
sudo apt-get install -y docker-compose

#sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
