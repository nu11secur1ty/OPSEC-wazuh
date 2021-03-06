#!/usr/bin/bash
# @nu11secur1ty
kill -9 $(pgrep -f elasticsearch)
kill -9 $(pgrep -f filebeat)
kill -9 $(pgrep -f wazuh)
kill -9 $(pgrep -f kibana)

# Removing
apt-get purge wazuh-manager -y
rm -rf /etc/*wazuh*
rm -rf /etc/apt/sources.list.d/*wazuh*
  
apt-get purge filebeat -y
rm -rf /etc/*filebeat*

apt-get purge --auto-remove opendistroforelasticsearch -y
rm -rf /etc/*elastic*
rm -rf /usr/share/elasticsearch/

apt-get purge --auto-remove elasticsearch-oss opendistroforelasticsearch -y
rm -rf /usr/share/*elasticsearch*
rm -rf /etc/default/*elasticsearch*
rm -rf /etc/init.d/*elasticsearch*
rm -rf /var/lib/*elasticsearch*
rm -rf /etc/*elasticsearch*

apt-get purge opendistroforelasticsearch-kibana -y
rm -rf /etc/*kibana*

# cleaning
apt-get update -y
apt-get dist-upgrade -y
apt-get autoremove -y
dpkg --configure -a
apt-get --fix-broken install -y
apt-get autoremove -y

exit 0;
