#!/bin/bash

INT_NAME='enp7s0'

iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
#ssh
iptables -A INPUT -i $INT_NAME -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i $INT_NAME -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i tun0 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i tun0 -p tcp -m tcp --dport 22 -j ACCEPT
#dhcp
iptables -A INPUT -i $INT_NAME -p udp -m udp --dport 67 -j ACCEPT
iptables -A INPUT -i $INT_NAME -p tcp -m tcp --dport 67 -j ACCEPT

iptables -P INPUT DROP
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

iptables -A INPUT -p icmp -m icmp --icmp-type 8 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#iptables -A INPUT -s 192.168.255.0/24 -i eth1 -p icmp -m icmp --icmp-type 8 -j ACCEPT
