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
cd theHarvester
python3 theHarvester.py -d microsoft.com -b bing -l 5 > result.txt
```

### maltego

```
maltego
```

### recon-ng

```
recon-ng
```


### Tools for Active Reconnaissance

### dirb

```
dirb http://$MS2/
```




### httrack

```
httrack http://$MS2/ -O /copyweb
```

### nmap

#### Ping Sweep Scan

```
nmap -sP $NETRANGE
```

#### TCP Full Scan

```
nmap -sT $MS2 -oA nmap-output
```

#### TCP Full Scan
```
nmap -sT $MS2 -oA nmap-output-fullscan
```

#### Steath Scan
```
nmap -sS $MS2 -oA nmap-output-steathscan
```

#### Version Scan
```
nmap -sV $MS2 -oA nmap-output-versionscan
```

#### Other Commands
```
nmap -F $MS2

nmap -sn $MS2

nmap -Pn $MS2
 
nmap -p 1-200 $MS2

echo $MS2 > nmap-input-file.txt
nmap -iL -sT
```

### enum4linux

```
enum4linux $MS2 > enum4linux-output.txt
```

### cewl

```
cewl http://$MS2/dvwa -w words.txt
```

### Open Source Intelligence Sources
#### Netcraft https://www.netcraft.com/
#### Haveibeenpwned https://haveibeenpwned.com/
#### SHODAN https://www.shodan.io
#### Censys https://censys.io/

### Dimitry

```
dmitry -s microsoft.com
```

### Wafw00f

```
wafw00f http://$MS2
```


### Recon-ng
```
recong-ng
```

## Module 03: Vulnerability Assesment

### Nmap Vulnerability Scan

```
nmap --script vuln $MS2
```


### Skipfish

```
skipfish -o mutillidae http://$MS2/multillidae
```

## Module 04: Exploitation

Coming Soon

## Module 05: Post-Exploitation

Coming Soon

## Module 06: Reporting

Coming Soon