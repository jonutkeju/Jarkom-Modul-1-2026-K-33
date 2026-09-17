# Di mika langsung
cat > /root/traffic_protocol7.sh <<'EOF'
#!/bin/sh

echo "=== ICMP TRAFFIC ==="

ping -c 4 8.8.8.8
ping -c 4 1.1.1.1
ping -c 4 its.ac.id

echo ""
echo "=== DNS TRAFFIC ==="

nslookup google.com 8.8.8.8
nslookup its.ac.id 8.8.8.8
nslookup github.com 1.1.1.1

dig @8.8.8.8 example.com A
dig @1.1.1.1 cloudflare.com AAAA
EOF

chmod +x /root/traffic_protocol7.sh

# Step selanjutnya jalanin wireshark diantara Mika dan Switch 1
# Filter dns || icmp

sh /root/traffic_protocol7.sh