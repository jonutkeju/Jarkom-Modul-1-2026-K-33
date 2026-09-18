# Ini di Lain
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Di salah satu client (Ini bebas ntah dimana)
ping -c 4 10.80.1.1
ping -c 4 10.80.2.1
ping -c 4 10.80.2.1
# Itu cuma buat ngebuktiin koneksi ajah