#!/usr/bin/python
import os

os.system("apt update -y")
os.system("apt dist-upgrade -y")
os.system("apt autoremove -y") 
os.system("dpkg --configure -a")
os.system("apt --fix-broken install -y")
os.system("systemctl enable elasticsearch.service")
os.system("systemctl start elasticsearch.service")
