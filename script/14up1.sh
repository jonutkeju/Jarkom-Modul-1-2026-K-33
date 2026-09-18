#!/bin/bash

echo "[+] Memulai update package..."
sudo apt-get update

echo "[+] Memulai instalasi tshark dan zip..."
sudo apt-get install -y tshark python3 python3-pip zip

chmod +x decode.py 2>/dev/null

echo "[+] Menyiapkan file ZIP..."
zip -r tools_network.zip setup.sh decode.py

echo "[+] Berhasil!"