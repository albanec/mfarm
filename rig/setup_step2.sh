#!/bin/bash
INT_NAME='enp7s0'

### install 
apt-get update 
apt-get install -y openvpn iptables-persistent fail2ban clinfo libcurl3 libcurl4-openssl-dev \
    powertop htop nmon lm-sensors git tmux \
    gcc make build-essential

### iptables setup
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

dpkg-reconfigure iptables-persistent

### kernel setup
# защита от ошибки  'too many open files'
echo 'rig_admin soft nofile 65000' >> /etc/security/limits.conf
echo 'rig_admin hard nofile 65000' >> /etc/security/limits.conf
echo 'session required pam_limits.so' >> /etc/pam.d/common-session

## оптимизация энергопотребления
echo 'vm.laptop_mode = 5' >> /etc/sysctl.conf

## работа с памятью
# % свободной памяти, при котором данные сваливаются в кэш
echo 'vm.swappiness = 5' >> /etc/sysctl.conf
# параметры кэша
echo 'vm.vfs_cache_pressure = 1000' >> /etc/sysctl.conf
echo 'vm.dirty_background_ratio = 1' >> /etc/sysctl.conf
echo 'vm.dirty_ratio = 90' >> /etc/sysctl.conf
echo 'vm.dirty_writeback_centisecs = 60000' >> /etc/sysctl.conf

page_size=`getconf PAGE_SIZE`
phys_pages=`getconf _PHYS_PAGES`
shmall=`expr $phys_pages / 2`
shmmax=`expr $shmall \* $page_size`
echo 'kernel.shmmax = '$shmmax >> /etc/sysctl.conf
echo 'kernel.shmall = '$shmall >> /etc/sysctl.conf

sudo sync
echo 3 > /proc/sys/vm/drop_caches

## настройка сети
# inet6
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.all.accept_redirects = 0' >> /etc/sysctl.conf
# inet
# запрет на редиректы
echo 'net.ipv4.conf.all.accept_redirects = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.secure_redirects = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.send_redirects = 0' >> /etc/sysctl.conf
# max количество сокетов
# echo 'net.ipv4.tcp_max_orphans = 65536' >> /etc/sysctl.conf
# таймаут висящих сокетов
echo 'net.ipv4.tcp_fin_timeout = 10' >> /etc/sysctl.conf
# keepalive тамеры для tcp
echo 'net.ipv4.tcp_keepalive_time = 1800' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_intvl = 15' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_probes = 5' >> /etc/sysctl.conf
# количество сохраняемых syn-запросов
echo 'net.ipv4.tcp_max_syn_backlog = 1280' >> /etc/sysctl.conf
# количество посылок повторных synack
echo 'net.ipv4.tcp_synack_retries = 1' >> /etc/sysctl.conf

# настройки памяти, выделяемой на tcp
# echo 'net.ipv4.tcp_mem = 50576   64768   98152' >> /etc/sysctl.conf
# настройки памяти, выделяемой на приёмный буфер tcp
# echo 'net.ipv4.tcp_rmem = 4096 87380 16777216' >> /etc/sysctl.conf
# настройки памяти, выделяемой на передающий буфер tcp
# echo 'net.ipv4.tcp_wmem = 4096 65536 16777216' >> /etc/sysctl.conf

# запрет на хранение разорванных сессий
echo 'net.ipv4.tcp_orphan_retries = 0' >> /etc/sysctl.conf
#
echo 'net.ipv4.tcp_syncookies = 1' >> /etc/sysctl.conf

# настройка conntrack
# echo 'net.ipv4.netfilter.ip_conntrack_max = 16777216' >> /etc/sysctl.conf
#echo 'net.netfilter.nf_conntrack_max = 16777216' >> /etc/sysctl.conf

# настройки tcp_congestion_control
echo 'net.ipv4.tcp_timestamps = 0' >> /etc/sysctl.conf
# echo 'net.ipv4.tcp_sack = 1' >> /etc/sysctl.conf
# echo 'net.ipv4.tcp_congestion_control = htcp' >> /etc/sysctl.conf
# echo 'net.ipv4.tcp_no_metrics_save = 1' >> /etc/sysctl.conf

# защита от ip-спуфинга
echo 'net.ipv4.conf.all.rp_filter = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.lo.rp_filter = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.eth0.rp_filter = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.default.rp_filter = 1' >> /etc/sysctl.conf

# защита от source-route
echo 'net.ipv4.conf.all.accept_source_route = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.lo.accept_source_route = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.eth0.accept_source_route = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.default.accept_source_route = 0' >> /etc/sysctl.conf

# общие параметры tcp
echo 'net.ipv4.ip_local_port_range = 1024 65535' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_window_scaling = 1' >> /etc/sysctl.conf
# защита от time-wait атак
echo 'net.ipv4.tcp_rfc1337 = 1' >> /etc/sysctl.conf

# настройки icmp
echo 'net.ipv4.icmp_echo_ignore_broadcasts = 1' >> /etc/sysctl.conf
# echo 'net.ipv4.icmp_echo_ignore_all = 1' >> /etc/sysctl.conf
echo 'net.ipv4.icmp_ignore_bogus_error_responses = 1' >> /etc/sysctl.conf

# настройка сокетов в режиме time-wait
# echo 'net.ipv4.tcp_max_tw_buckets = 720000' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_tw_recycle = 1' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_tw_reuse = 1' >> /etc/sysctl.conf

# max количество подключений к сокету
# echo 'net.core.somaxconn = 65535' >> /etc/sysctl.conf
# размер пакетной очереди
echo 'net.core.netdev_max_backlog = 1000' >> /etc/sysctl.conf

# размеры буферов под сетевые соединения
# echo 'net.core.rmem_max = 33554432' >> /etc/sysctl.conf
# echo 'net.core.wmem_max = 33554432' >> /etc/sysctl.conf
# echo 'net.core.rmem_default = 65536' >> /etc/sysctl.conf
# echo 'net.core.wmem_default = 65536' >> /etc/sysctl.conf
# echo 'net.ipv4.tcp_rmem = 4096 8388608 16777216' >> /etc/sysctl.conf
# echo 'net.ipv4.tcp_wmem = 4096 4194394 16777216' >> /etc/sysctl.conf

# echo 'net.ipv4.ip_forward = 0' >> /etc/sysctl.conf

echo 'kernel.core_uses_pid = 1' >> /etc/sysctl.conf

## настройка fs
# настройка inotify
echo 'fs.inotify.max_user_watches = 16777216' >> /etc/sysctl.conf
echo 'fs.inotify.max_queued_events = 65536' >> /etc/sysctl.conf

sysctl -p

exit
