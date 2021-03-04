#!/usr/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install -f
apt-get autoremove -y
apt install apache2 vim git gcc net-tools -y
  exit 0;
