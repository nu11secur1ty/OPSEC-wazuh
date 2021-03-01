#!/usr/bin/perl
# @nu11secur1ty 2021
use strict;
use warnings;
use diagnostics;

# Packages
my $pack_ = `apt-get update && apt-get upgrade -y`;

# Up OS
my $UP = `apt-get dist-upgrade -y`;

# Need to install
my $need_to_install = `apt-get install apache2 vim git curl default-jre default-jdk gcc -y`;

# Deploy Siem
my $action_= `curl -so ~/all-in-one-installation.sh https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/unattended-installation/all-in-one-installation.sh && bash ~/all-in-one-installation.sh`;

# Reload
my $reload = `telinit 6`;
  exit 0;
