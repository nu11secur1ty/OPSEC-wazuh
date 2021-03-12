#!/usr/bin/bash
# nu11secur1ty automation 2021 OPSEC Ltd
# Upgrading the Wazuh manager

curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update
  apt-get install wazuh-manager

# Disabling the Wazuh repository
  
