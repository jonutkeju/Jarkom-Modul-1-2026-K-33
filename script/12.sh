# Di Knights
cat > /root/setup.sh <<'EOF'
#!/bin/sh

echo "nameserver 8.8.8.8" > /etc/resolv.conf

apk update

if ! command -v sshd >/dev/null 2>&1; then
    apk add openssh
fi

if ! command -v nc >/dev/null 2>&1; then
    apk add netcat-openbsd
fi

ssh-keygen -A

pkill sshd 2>/dev/null
/usr/sbin/sshd

mkdir -p /root/www
echo "Knights Secret HTTP Service" > /root/www/index.html

pkill httpd 2>/dev/null
httpd -f -p 80 -h /root/www &

EOF

chmod +x /root/setup.sh

sh /root/setup.sh

# Capture antara Lain dengan Switch 3
# Filter tcp.port==22 || tcp.port==80 || tcp.port==7777

# Alice
nc -vz 10.80.3.10 22
nc -vz 10.80.3.10 80
nc -vz 10.80.3.10 7777
# Harusnya yang terakhir direfuse