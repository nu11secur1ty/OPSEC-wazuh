#!/usr/bin/bash
# Packages
apt update && apt upgrade -y 
apt dist-upgrade -y
apt install vim git curl default-jre default-jdk gcc -y
curl -so ~/all-in-one-installation.sh https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/unattended-installation/all-in-one-installation.sh && bash ~/all-in-one-installation.sh
telinit 6
  exit 0;
