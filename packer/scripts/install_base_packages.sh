#!/bin/bash -ex
# Script used to install base packages for AMIs
sudo apt-get update

# Install base packages
sudo apt-get install -y git curl wget htop build-essential rsync make unzip emacs vim python-setuptools python-pip tree gdisk kpartx xfsprogs docker.io ruby1.9.1 ruby1.9.1-dev make

# Install aws cli
sudo easy_install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz
sudo pip install awscli

# pull common docker images
sudo docker.io pull ubuntu:12.04
sudo docker.io pull ubuntu:14.04
sudo docker.io pull debian:wheezy
sudo docker.io pull debian:jessie
sudo docker.io pull charliek/myweather:0.0.2