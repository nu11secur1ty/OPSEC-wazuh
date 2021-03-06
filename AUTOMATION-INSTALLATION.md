# Installing the OPSEC-Wazuh SIEM 4.1.1 on Ubuntu Server 20.04

[check_script_update_4.1.1](https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.1/resources/open-distro/unattended-installation/all-in-one-installation.sh)

[check_script_update_4.0.4](https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.0/resources/open-distro/unattended-installation/all-in-one-installation.sh)

![](https://github.com/nu11secur1ty/wazuh/blob/master/OPSEC/logo.png)

```bash
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh/master/needtoinstall.sh | bash
```
- - - Installing the OPSEC-Wazuh SIEM
```bash
# 4.0.4 - Stable
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh-OPSEC/master/sakai-4.0.4.sh | bash
# 4.1.1
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh/master/sakai-4.1.1-03.05.2021.sh | bash
```
- - - Get the source and configure from inside
```bash
cd /opt/
git clone https://github.com/nu11secur1ty/wazuh-OPSEC.git
```
- Navigate to the parent directory
```bash
cd wazuh-OPSEC/
```
- Password changing for `admin`
```bash
bash pass_changer-4.1.1.sh -u admin -p your_password
```
-  Deploying the OPSEC Panel
```bash
bash deploypanel.sh
```
- Cleaning of the unnecessary keys
```bash
bash cleankey.sh
```
- Update OS
```curl
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh/master/updateOS.py | python3
```
## BR
