# Di Knights
adduser -D -s /bin/ash admin_mika

# Di Mika
mkdir -p /root/.ssh
ssh-keygen -t ed25519
# enter tiga kali
cat /root/.ssh/id_ed25519.pub

# Ke Knights lagi
mkdir -p /home/admin_mika/.ssh
cat > /home/admin_mika/.ssh/authorized_keys
# Paste isi ssh kedalem
chmod g-s /home/admin_mika/.ssh
chmod 700 /home/admin_mika/.ssh
chmod 600 /home/admin_mika/.ssh/authorized_keys
chown -R admin_mika:admin_mika /home/admin_mika/.ssh

sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

passwd -u admin_mika

pkill sshd
/usr/sbin/sshd

# Mika
# Hapus entry lama dulu pakai ssh-keygen -R 10.80.3.10
ssh admin_mika@10.80.3.10
# Login berhasil tanpa password
exit

# Ke Wireshark capture antara Lain dgn Switch 3
# Filter tcp.port==22

ssh admin_mika@10.80.3.10

exit

# Lihat Wireshark
