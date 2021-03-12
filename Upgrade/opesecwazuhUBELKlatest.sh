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
echo "Give the user name and password sync"
read user
read pass
curl -X POST "https://127.0.0.1:9200/_flush/synced" -u $user:$pass -k

systemctl stop elasticsearch
apt-get install elasticsearch=7.10.2
systemctl daemon-reload
systemctl enable elasticsearch
systemctl start elasticsearch

echo "Credentials for nodes"
read usern
read passn
curl -X GET "https://127.0.0.1:9200/_cat/nodes" -u $usern:$passn -k

echo "Credentials for cluster"
read userc
read passc
curl -X PUT "https://127.0.0.1:9200/_cluster/settings" -u $userc:$passc -k -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "all"
  }
}
'
echo "Credentials for health"
read userh
read passh
curl -X GET "https://127.0.0.1:9200/_cat/health?v" -u <username>:<password> -k

### Upgrading Filebeat
apt-get install filebeat=7.10.2
curl -so /etc/filebeat/wazuh-template.json https://raw.githubusercontent.com/wazuh/wazuh/v4.1.2/extensions/elasticsearch/7.x/wazuh-template.json
chmod go+r /etc/filebeat/wazuh-template.json
curl -s https://packages.wazuh.com/4.x/filebeat/wazuh-filebeat-0.1.tar.gz | sudo tar -xvz -C /usr/share/filebeat/module

IP=$(hostname -I | cut -d' ' -f1)
sed -i 's/['http://YOUR_ELASTIC_SERVER_IP:9200']/['http://$IP:9200']' /etc/filebeat/filebeat.yml

systemctl daemon-reload
systemctl enable filebeat
systemctl start filebeat

filebeat setup --index-management -E output.logstash.enabled=false

# Upgrading Kibana
# 3.12.x
mkdir -p /usr/share/kibana/data/wazuh/config/
cp /usr/share/kibana/optimize/wazuh/config/wazuh.yml /usr/share/kibana/data/wazuh/config/wazuh.yml
sed -i 's/user/username/g' /usr/share/kibana/data/wazuh/config/wazuh.yml

cd /usr/share/kibana/
sudo -u kibana bin/kibana-plugin remove wazuh

apt-get install kibana=7.10.2

rm -rf /usr/share/kibana/optimize/bundles
rm -f /usr/share/kibana/optimize/wazuh/config/wazuh-registry.json

chown -R kibana:kibana /usr/share/kibana
chown -R kibana:kibana /usr/share/kibana/plugins

cd /usr/share/kibana/
sudo -u kibana /usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.1.2_7.10.2-1.zip

sudo chown kibana:kibana /usr/share/kibana/data/wazuh/config/wazuh.yml
sudo chmod 600 /usr/share/kibana/data/wazuh/config/wazuh.yml

cat >> /etc/default/kibana << EOF
NODE_OPTIONS="--max_old_space_size=2048"
EOF

setcap 'cap_net_bind_service=+ep' /usr/share/kibana/node/bin/node

systemctl daemon-reload
systemctl enable kibana
systemctl start kibana

echo "Elastic pass"
read elastic
curl 'https://$IP:5601/api/saved_objects/index-pattern/wazuh-alerts-3.x-*' -X DELETE  -H 'Content-Type: application/json' -H 'kbn-version: 7.10.2' -k -uelastic:$elastic

# Disabling the repository

sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/elastic-7.x.list
apt-get update
echo "elasticsearch hold" | sudo dpkg --set-selections
echo "filebeat hold" | sudo dpkg --set-selections
echo "kibana hold" | sudo dpkg --set-selections


