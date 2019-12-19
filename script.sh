#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

#Jenkins installation and setup
sudo yum -y update
sudo yum -y install java-1.8.0
sudo yum -y remove java-1.7.0-openjdk
sudo yum -y install python-pip
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
sudo service jenkins start
sudo chkconfig --add jenkins
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
url="https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip"
filename=$(basename "$url")
sudo wget "$url"
sudo unzip $filename -d /usr/local/bin
pip install awscli --upgrade
sudo yum -y install git
