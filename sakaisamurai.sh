#!/usr/bin/bash
# @nu11secur1ty
apt-get purge wazuh-manager -y
apt-get purge filebeat -y
apt-get purge opendistroforelasticsearch -y
  rm -rf /usr/share/elasticsearch/
apt-get purge --auto-remove opendistroforelasticsearch -y
apt-get purge opendistroforelasticsearch-kibana -y
rm -rf /etc/*wazuh*
rm -rf /var/lib/elasticsearch
rm -rf /etc/elasticsearch
rm -rf /etc/apt/sources.list.d/*wazuh*

apt-get autoremove -y

exit 0;
