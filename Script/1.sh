# Ini di Console Router (Lain)
ip link set eth0 up
ip link set eth1 up
ip link set eth2 up
ip link set eth3 up

ip addr add 10.80.1.1/24 dev eth1
ip addr add 10.80.2.1/24 dev eth2
ip addr add 10.80.3.1/24 dev eth3

# Ini di NAT
udhcpc -i eth0

# Alice
ip addr add 10.80.1.10/24 dev eth0
ip route add default via 10.80.1.1

# Mika
ip addr add 10.80.1.11/24 dev eth0
ip route add default via 10.80.1.1

# Chisa
ip addr add 10.80.2.10/24 dev eth0
ip route add default via 10.80.2.1

# Knights
ip addr add 10.80.3.10/24 dev eth0
ip route add default via 10.80.3.1

# Eiri
ip addr add 10.80.3.11/24 dev eth0
ip route add default via 10.80.3.1