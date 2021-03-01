#!/usr/bin/bash
# @nu11secur1ty
# Docs
# https://documentation.wazuh.com/4.0/user-manual/elasticsearch/elastic_tuning.html#change-users-password
cd /usr/share/elasticsearch/plugins/opendistro_security/tools/
./securityadmin.sh -backup /home/ -nhnv -cacert /etc/elasticsearch/certs/root-ca.pem -cert /etc/elasticsearch/certs/admin.pem -key /etc/elasticsearch/certs/admin.key -icl -h localhost

# Working...
# Change hash key in backup internal_users.yml
# rm -rf /home/internal_users.yml
#cd
#cd /usr/share/elasticsearch/plugins/opendistro_security/tools/
#./securityadmin.sh -f /home/internal_users.yml -t internalusers -nhnv -cacert /etc/elasticsearch/certs/root-ca.pem -cert /etc/elasticsearch/certs/admin.pem -key /etc/elasticsearch/certs/admin.key -icl -h localhost
