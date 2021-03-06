#!/usr/bin/bash
# @nu11secur1ty
apt-get purge wazuh-manager -y
  rm -rf /etc/*wazuh*
apt-get purge filebeat -y
  rm -rf /etc/*filebeat*
apt-get purge opendistroforelasticsearch -y
apt purge elasticsearch -y
  rm -rf /etc/*elastic*
  rm -rf /usr/share/elasticsearch/
apt-get purge --auto-remove opendistroforelasticsearch -y
apt-get purge elasticsearch-oss opendistroforelasticsearch -y
rm -rf /usr/share/*elasticsearch*
apt-get purge opendistroforelasticsearch-kibana -y
  rm -rf /etc/*kibana*
rm -rf /etc/*wazuh*
rm -rf /var/lib/elasticsearch
rm -rf /etc/elasticsearch
rm -rf /etc/apt/sources.list.d/*wazuh*
# cleaning
apt-get update -y
apt-get dist-upgrade -y
apt-get autoremove -y
dpkg --configure -a
apt-get --fix-broken install -y
apt-get autoremove -y

exit 0;
