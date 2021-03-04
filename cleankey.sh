#!/usr/bin/bash
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key del --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 
apt-key del --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt update && apt upgrade && apt autoremove -y
