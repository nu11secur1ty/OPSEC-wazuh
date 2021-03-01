#!/usr/bin/bash
# @nu11secur1ty 2021

# Packages and cleaning
rm -rf /etc/apt/sources.list.d/*wazuh.list*
dpkg --configure -a
apt-get update && apt-get upgrade -y

# Up OS
apt-get dist-upgrade -y

# Need to install
apt-get install vim git curl default-jre default-jdk gcc -y

# Deploy Siem
curl -so ~/all-in-one-installation.sh https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/unattended-installation/all-in-one-installation.sh && bash ~/all-in-one-installation.sh

# Reload
rm -rf ~/all-in-one-installation.sh
rm -rf /var/lib/elasticsearch
rm -rf /etc/elasticsearch

  exit 0;
