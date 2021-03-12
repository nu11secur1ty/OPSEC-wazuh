#!/usr/bin/bash
# nu11secur1ty automation 2021 OPSEC Ltd
# Upgrading the Wazuh manager

curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update
  apt-get install wazuh-manager

# Disabling the Wazuh repository
sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/wazuh.list
  apt-get update
  echo "wazuh-manager hold" | sudo dpkg --set-selections
  
# Upgrading Elastic Stack basic license
# stop the services
systemctl stop filebeat
systemctl stop kibana
  curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
  echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
  apt-get update
  sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/wazuh.list
apt-get update
  
# Upgrading Elasticsearch

curl -X PUT "https://127.0.0.1:9200/_cluster/settings"  -u <username>:<password> -k -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "primaries"
  }
}
'
echo "Give the user name and password"
read user
read pass
curl -X POST "https://127.0.0.1:9200/_flush/synced" -u $user:$pass -k
