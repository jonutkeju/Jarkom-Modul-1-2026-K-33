# Di CHISA
cat > /root/setup.sh <<'EOF'
#!/bin/sh

echo "======================================"
echo " SETUP FTP + TELNET CHISA"
echo "======================================"

echo "nameserver 8.8.8.8" > /etc/resolv.conf

apk update

if ! command -v vsftpd >/dev/null 2>&1; then
    apk add vsftpd
fi

if ! command -v telnetd >/dev/null 2>&1; then
    apk add busybox-extras
fi

mkdir -p /var/wired/data
mkdir -p /etc/vsftpd/user_conf

chmod 755 /var/wired
chmod 777 /var/wired/data

if ! id alice >/dev/null 2>&1; then
    adduser -D -s /bin/ash alice
fi

if ! id mika >/dev/null 2>&1; then
    adduser -D -s /bin/ash mika
fi

if ! id eiri >/dev/null 2>&1; then
    adduser -D -s /bin/ash eiri
fi

echo "alice:alice" | chpasswd
echo "mika:mika" | chpasswd
echo "eiri:eiri" | chpasswd

cat > /etc/vsftpd/vsftpd.conf <<'CONF'
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES

local_root=/var/wired/data

chroot_local_user=YES
allow_writeable_chroot=YES

userlist_enable=YES
userlist_deny=YES
userlist_file=/etc/vsftpd.userlist

user_config_dir=/etc/vsftpd/user_conf

seccomp_sandbox=NO
CONF

echo "eiri" > /etc/vsftpd.userlist

cat > /etc/vsftpd/user_conf/alice <<'CONF'
write_enable=YES
CONF

cat > /etc/vsftpd/user_conf/mika <<'CONF'
write_enable=NO
CONF

if [ -f /root/report.txt ]; then
    cp /root/report.txt /var/wired/data/report.txt
fi

if [ -f /root/protocol7_manifesto.txt ]; then
    cp /root/protocol7_manifesto.txt /var/wired/data/protocol7_manifesto.txt
fi

pkill vsftpd 2>/dev/null
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &

if ! id phantom_user >/dev/null 2>&1; then
    adduser -D -s /bin/ash phantom_user
fi

echo "phantom_user:wired_ghost" | chpasswd

pkill telnetd 2>/dev/null
/usr/sbin/telnetd -p 23 &
EOF

chmod +x /root/setup.sh

sh /root/setup.sh