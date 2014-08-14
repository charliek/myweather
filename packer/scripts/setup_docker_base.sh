#!/bin/bash -ex

# I was having issues when installing docker on an instance backed AMI so I split this file
# out so it is only run on ebs images. Still need to figure out what I need to do to get
# docker burned on an instance backed image.

# this will pretty much only work on ubuntu 14.04
sudo apt-get install -y docker.io

# pull common docker images
sudo docker.io pull ubuntu:12.04
sudo docker.io pull ubuntu:14.04
sudo docker.io pull debian:wheezy
sudo docker.io pull debian:jessie
sudo docker.io pull charliek/myweather:0.0.2