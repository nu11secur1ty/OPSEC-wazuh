# Installing the OPSEC-Wazuh SIEM 4.1.1 on Ubuntu Server 20.04

![](https://github.com/nu11secur1ty/wazuh/blob/master/OPSEC/logo.png)

```bash
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh/master/needtoinstall.sh | bash
```
- - - Installing the OPSEC-Wazuh SIEM
```bash
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh/master/sakai-4.1.1.sh | bash
```
- - - Get the source and configure from inside
```bash
cd /opt/
git clone https://github.com/nu11secur1ty/wazuh.git
```
- Navigate to the parent directory
```bash
cd wazuh/
```
- Password changing for `admin`
```bash
bash pass_changer-4.1.1.sh
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
curl -s https://raw.githubusercontent.com/nu11secur1ty/wazuh/master/updateOS.py | python
```
## BR
