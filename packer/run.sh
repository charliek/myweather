#!/bin/bash -eux
packer build -var-file="$HOME/.packer/charliek_ec2.json" build.json