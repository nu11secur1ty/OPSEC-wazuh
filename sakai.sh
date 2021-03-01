#!/usr/bin/bash
# @nu11secur1ty 2021
apt install curl apt-transport-https unzip wget libcap2-bin software-properties-common lsb-release gnupg2 -y
echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
add-apt-repository ppa:openjdk-r/ppa
apt update -y
export JAVA_HOME=/usr/ && apt install openjdk-11-jdk
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update -y
apt-get install wazuh-manager -y
systemctl daemon-reload
systemctl enable wazuh-manager
systemctl start wazuh-manager
systemctl status wazuh-manager 
# Elastic
apt install elasticsearch-oss opendistroforelasticsearch -y


  exit 0;
