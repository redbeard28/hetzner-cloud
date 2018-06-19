#!/bin/bash

apt-add-repository ppa:ansible/ansible -y

echo ""
echo"##### UPGRADE #####"
echo ""
apt-get update
apt-get upgrade -y

echo ""
echo "##### INSTALL ANSIBLE #####"
echo ""
apt-get -y  install python-pip fail2ban vim git-core libdigest-sha-perl cpanminus software-properties-common ansible


echo ""
echo "##### Install docker-ce #####"
echo ""
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce -y

git clone https://github.com/redbeard28/hetzner-cloud.git
#cd hetzner-cloud
#ansible-playbook -i 'localhost,' -c local playbooks/prequisits.yml -e site=hetzner --tags dynu