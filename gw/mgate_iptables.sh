

iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
#ssh
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i tun0 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i tun0 -p tcp -m tcp --dport 22 -j ACCEPT
#ovpn
iptables -A INPUT -i eth0 -p udp -m udp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# dhcp
iptables -A INPUT -i eth0 -p udp -m udp --dport 67 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 67 -j ACCEPT
#цепочка postrouting
iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o eth0 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -s 192.168.88.0/24 -o eth0 -j MASQUERADE

iptables -P INPUT DROP
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT


iptables -A INPUT -p icmp -m icmp --icmp-type 8 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#iptables -A INPUT -s 192.168.255.0/24 -i eth1 -p icmp -m icmp --icmp-type 8 -j ACCEPT

dpkg-reconfigure iptables-persistent
