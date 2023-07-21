 #!/bin/bash
 debianip=$(nslookup der.hellorainman.eu.org | grep 10.181.* | awk '{print $3}')   &&
 winip=$(nslookup pcv4.hellorainman.eu.org | grep 10.181.* | awk '{print $3}')  &&
echo "$debianip    mb3admin.com     " >> /etc/hosts && killall -SIGHUP dnsmasq  &&
iptables -t nat -A PREROUTING -p tcp -d $debianip --dport 445 -j DNAT --to $debianip:10800 &&
iptables -t nat -A PREROUTING -p tcp -d $winip --dport 445 -j DNAT --to $winip:10800
