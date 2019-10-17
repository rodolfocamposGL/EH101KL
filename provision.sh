#!/usr/bin/env bash


# Ethical Hacking 101 with Kali Linux
# Author: Rodolfo Campos (rodolfo.campos[at]gorillalogic.com)


apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

echo "[+] Installing VirtualBox Guest Addtions in Kali Linux"
apt-get install -y virtualbox-guest-x11

echo "[+] Installing Other Useful Tools"

# Installing AMAP (Application Map)
apt-get install -y amap

# Installing Exiftool
apt-get install -y exiftool

# Installing HTTrack
apt-get install -y httrack


echo "[+] Installing Openvas"
apt-get install -y openvas
openvas-setup
openvasmd --user=admin -new-password=admin

# Setting Up Metasploit
echo "[+] Initializing Metasploit Database"
msfdb init

# Updating Nmap Scripts
echo "[+] Updating Nmap Script Database"
nmap --script-updatedb

# Fix theharvester
echo "[+] Updating Nmap Script Database"
git clone https://github.com/laramies/theHarvester
cd theHarvester
pip3 -r requirements.txt
cd ..

# Installing Arachni-Web UI
echo "[+] Installing Arachni Web Scanner"
wget https://github.com/Arachni/arachni/releases/download/v1.5.1/arachni-1.5.1-0.5.12-linux-x86_64.tar.gz
tar xvzf arachni-1.5.1-0.5.12-linux-x86_64.tar.gz
mv arachni-1.5.1-0.5.12 arachni


# Provision Plugins
echo "[+] Installing Recon-ng Plugins"
recon-ng $(pwd)/plugins.ng
