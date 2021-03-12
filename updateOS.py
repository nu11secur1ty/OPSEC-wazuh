#!/usr/bin/python
import os

os.system("apt update -y")
os.system("apt dist-upgrade -y")
os.system("apt autoremove -y") 
os.system("dpkg --configure -a")
os.system("apt --fix-broken install -y")
os.system("apt list --upgradable")
