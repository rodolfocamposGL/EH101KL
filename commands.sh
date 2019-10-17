#!/usr/bin/env bash


# Ethical Hacking 101 with Kali Linux
# Author: Rodolfo Campos (rodolfo.campos[at]gorillalogic.com)

NETRANGE="10.0.50.0/24"

MS2="10.0.50.X"

mkdir reports/

# Module 01: Information Gathering

# Tools for Passive Reconnaissance

# nslookup
nslookup microsoft.com

# netdiscover
netdiscover

# host
host microsoft.com

# dig
dig microsoft.com
dig MX microsoft.com

# whois
whois nmap.org

# exiftool
exiftool -h

# theharvester
cd theHarvester
python3 theHarvester.py -d microsoft.com -b bing -l 5 > result.txt


# Tools for Active Reconnaissance

# dirb
dirb http://$MS2/ > reports/dirbresult.txt

# httrack
httrack http://$MS2/ -O /copyweb

# nmap

# Ping Sweep Scan
nmap -sP $NETRANGE

# TCP Full Scan
nmap -sT $MS2 -oA nmap-output-fullscan

# Steath Scan
nmap -sS $MS2 -oA nmap-output-steathscan

# Version Scan
nmap -sV $MS2 -oA nmap-output-versionscan

# Fast mode - Scan fewer ports than the default scan
nmap -F $MS2

# Ping Scan
nmap -sn $MS2

# Treat all hosts as online -- skip host discovery
nmap -Pn $MS2

# Scan ports in the range from 1 to 200
nmap -p 1-200 $MS2

# Scan Target from a File
echo $MS2 > nmap-input-file.txt
nmap -iL -sT
rm nmap-input-file.txt


# Traceroute
nmap -sn --traceroute $MS2

# Make two test with scrips

# enum4linux
enum4linux $MS2 > enum4linux-output.txt

# cewl

cewl http://$MS2/dvwa -w words.txt

# Open Source Intelligence Sources
# Netcraft https://www.netcraft.com/
# Haveibeenpwned https://haveibeenpwned.com/
# SHODAN https://www.shodan.io
# Censys https://censys.io/

# Get subdomains
dmitry -s www.domainname.com

# What I behind a firewall?
wafw00f http://$MS2 


recon-ng -r $(pwd)/demo.ng


nmap --script vuln $MS2 -oA vulnscannmap


nikto -h http://$MS2 -o reports/niktoscan.txt


