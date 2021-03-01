#!/usr/bin/bash
# @nu11secur1ty
apt-get remove filebeat -y
apt-get remove --purge filebeat -y
apt-get remove --auto-remove opendistroforelasticsearch -y
apt-get remove opendistroforelasticsearch-kibana -y
apt-get remove --purge opendistroforelasticsearch-kibana -y
apt-get autoremove -y
exit 0;
