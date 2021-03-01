#!/usr/bin/bash
# @nu11secur1ty
apt-get remove filebeat -y
apt-get remove --purge filebeat -y
apt-get remove --auto-remove opendistroforelasticsearch -y
apt-get remove opendistroforelasticsearch-kibana -y
apt-get remove --purge opendistroforelasticsearch-kibana -y
rm -rf /var/lib/elasticsearch
rm -rf /etc/elasticsearch
rm -rf /etc/apt/sources.list.d/*wazuh*

apt-get autoremove -y

exit 0;
