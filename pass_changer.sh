#!/usr/bin/bash
cd /usr/share/elasticsearch/plugins/opendistro_security/tools/
./securityadmin.sh -backup /home/ -nhnv -cacert /etc/elasticsearch/certs/root-ca.pem -cert /etc/elasticsearch/certs/admin.pem -key /etc/elasticsearch/certs/admin.key -icl -h localhost
