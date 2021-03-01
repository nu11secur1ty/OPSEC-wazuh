#!/usr/bin/bash
# @nu11secur1ty 2021
apt install curl apt-transport-https unzip wget libcap2-bin software-properties-common lsb-release gnupg2 -y
echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
add-apt-repository ppa:openjdk-r/ppa


  exit 0;
