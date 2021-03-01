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
curl -so /etc/elasticsearch/elasticsearch.yml https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/elasticsearch/7.x/elasticsearch_all_in_one.yml
rm /etc/elasticsearch/esnode-key.pem /etc/elasticsearch/esnode.pem /etc/elasticsearch/kirk-key.pem /etc/elasticsearch/kirk.pem /etc/elasticsearch/root-ca.pem -f
mkdir /etc/elasticsearch/certs
cd /etc/elasticsearch/certs
curl -so ~/search-guard-tlstool-1.8.zip https://maven.search-guard.com/search-guard-tlstool/1.8/search-guard-tlstool-1.8.zip
unzip ~/search-guard-tlstool-1.8.zip -d ~/searchguard
curl -so ~/searchguard/search-guard.yml https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/searchguard/search-guard-aio.yml
~/searchguard/tools/sgtlstool.sh -c ~/searchguard/search-guard.yml -ca -crt -t /etc/elasticsearch/certs/
rm /etc/elasticsearch/certs/client-certificates.readme /etc/elasticsearch/certs/elasticsearch_elasticsearch_config_snippet.yml ~/search-guard-tlstool-1.8.zip ~/searchguard -rf
  systemctl daemon-reload
  systemctl enable elasticsearch
  systemctl start elasticsearch
/usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh -cd /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/ -nhnv -cacert /etc/elasticsearch/certs/root-ca.pem -cert /etc/elasticsearch/certs/admin.pem -key /etc/elasticsearch/certs/admin.key
curl -XGET https://localhost:9200 -u admin:admin -k
# Filebeat
apt-get install filebeat
curl -so /etc/filebeat/filebeat.yml https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/filebeat/7.x/filebeat_all_in_one.yml
curl -so /etc/filebeat/wazuh-template.json https://raw.githubusercontent.com/wazuh/wazuh/4.1/extensions/elasticsearch/7.x/wazuh-template.json
chmod go+r /etc/filebeat/wazuh-template.json
curl -s https://packages.wazuh.com/4.x/filebeat/wazuh-filebeat-0.1.tar.gz | tar -xvz -C /usr/share/filebeat/module
mkdir /etc/filebeat/certs
cp /etc/elasticsearch/certs/root-ca.pem /etc/filebeat/certs/
mv /etc/elasticsearch/certs/filebeat* /etc/filebeat/certs/
systemctl daemon-reload
systemctl enable filebeat
systemctl start filebeat
filebeat test output
# Kibana
apt-get install opendistroforelasticsearch-kibana
curl -so /etc/kibana/kibana.yml https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/kibana/7.x/kibana_all_in_one.yml
mkdir /usr/share/kibana/data
chown -R kibana:kibana /usr/share/kibana/data
cd /usr/share/kibana
sudo -u kibana /usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.1.1_7.10.0-1.zip
mkdir /etc/kibana/certs
cp /etc/elasticsearch/certs/root-ca.pem /etc/kibana/certs/
mv /etc/elasticsearch/certs/kibana_http.key /etc/kibana/certs/kibana.key
mv /etc/elasticsearch/certs/kibana_http.pem /etc/kibana/certs/kibana.pem
setcap 'cap_net_bind_service=+ep' /usr/share/kibana/node/bin/node
systemctl daemon-reload
systemctl enable kibana
systemctl start kibana

  exit 0;
