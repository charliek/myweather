#!/bin/bash -ex

# Script used to install the EC2 AMI tools on Instance Backed instances for burning (not needed on EBS backed)
sudo mkdir -p /opt/ec2-ami-tools
sudo chown -R ubuntu /opt/ec2-ami-tools
wget -r -l 3 -O /opt/ec2-ami-tools/ec2-ami-tools-1.5.3.zip https://s3-us-west-2.amazonaws.com/bloomdev-public-assets/ec2/ec2-ami-tools-1.5.3.zip
cd /opt/ec2-ami-tools
sudo unzip ec2-ami-tools-1.5.3.zip
sudo rm ec2-ami-tools-1.5.3.zip
sudo chown -R root /opt/ec2-ami-tools
