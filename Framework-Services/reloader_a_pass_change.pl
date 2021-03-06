#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;


print "Stopping Please wait...\n";
    sleep 3;
# Stop Services
my $elastic_sto = `systemctl stop elasticsearch.service`;
my $kibana_sto = `systemctl stop kibana.service`;
my $filebeat_sto = `systemctl stop filebeat.service`;
my $wazuh_sto = `systemctl stop wazuh-manager.service`;

print "Starting Please wait...\n";
    sleep 3;
# Start Services
my $elastic_sta = `systemctl start elasticsearch.service`;
my $kibana_sta = `systemctl start kibana.service`;
my $filebeat_sta = `systemctl start filebeat.service`;
my $wazuh_sta = `systemctl start wazuh-manager.service`;

print "Restarting Please wait...\n";
    sleep 11;
# Restart Services
my $elastic_re = `systemctl restart elasticsearch.service`;
my $kibana_re = `systemctl restart kibana.service`;
my $filebeat_re = `systemctl restart filebeat.service`;
my $wazuh_re = `systemctl restart wazuh-manager.service`;

print "Status Checking Please wait...\n";
# Restart Services
my $elastic_stat = `systemctl status elasticsearch.service`;
my $filebeat_stat = `systemctl status filebeat.service`;
my $wazuh_stat = `systemctl status wazuh-manager.service`;
my $kibana_stat = `systemctl status kibana.service`;

print "The Status of elastic is:\n";
print "$elastic_stat\n";

print "The Status of filebeat is:\n";
print "$filebeat_stat\n";

print "The Status of wazuh is:\n";
print "$wazuh_stat\n";

print "The Status of kibana is:\n";
print "$kibana_stat\n";

  exit 0;
