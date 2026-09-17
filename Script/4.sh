# Lain
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT

iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Di (semua) client
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Di salah satu client (Ini bebas ntah dimana)
ping -c 4 8.8.8.8
ping -c 4 google.com