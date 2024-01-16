#!/bin/bash
# Purpose: Configure Ubuntu DHCP server
# https://ubuntu.com/server/docs/network-dhcp
# Author: Jose Maria Madronal GPL v2.0+ (Proxmox script)
# ------------------------------------------

# declare STRING variable
STRING="Script example"
f_dns_conf="https://raw.githubusercontent.com/joan032/DNS/master/named.conf.local"
f_dns_inversa="https://raw.githubusercontent.com/joan032/DNS/master/db.10"
f_dns_estacions="https://raw.githubusercontent.com/joan032/DNS/master/db.estacions.projecteinfovj.com"
f_dns_principal="https://raw.githubusercontent.com/joan032/DNS/master/db.projecteinfovj.com"


# Print variable on the screen
echo $STRING

# Install DHCP
sudo apt install bind9
sudo apt install dnsutils

# Download GitHub configuration file
wget $f_dns_conf
wget $f_dns_inversa
wget $f_dns_estacions
wget $f_dns_principal

# Copy the configuration file to /etc/dhcp directory
sudo cp named.conf.local /etc/bind/
sudo cp db.projecteinfovj.com /etc/bind/
sudo cp db.estacions.projecteinfovj.com /etc/bind/
sudo cp db.10 /etc/bind/

# Restart the DHCP server
sudo systemctl restart bind9
