#!/bin/bash -ex

# Script used to install base packages for AMIs
sudo apt-get update

# Install base packages

# Note that many of these packages will be needed for the ami tools, so make sure to test
# that process when editing this list
sudo apt-get install -y git curl wget htop build-essential rsync make unzip emacs vim python-setuptools python-pip tree gdisk kpartx xfsprogs ruby1.9.1 ruby1.9.1-dev make

# Install aws cli
sudo easy_install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz
sudo pip install awscli

