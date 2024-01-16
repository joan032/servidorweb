#!/bin/bash
# Purpose: Configure Ubuntu DHCP server
# https://ubuntu.com/server/docs/network-dhcp
# Author: Jose Maria Madronal GPL v2.0+ (Proxmox script)
# ------------------------------------------

# declare STRING variable
STRING="Script example"
f_web_conf="https://raw.githubusercontent.com/joan032/DNS/master/named.conf.local"
f_portada="https://raw.githubusercontent.com/joan032/servidorweb/main/portada.html"
f_error="https://raw.githubusercontent.com/joan032/servidorweb/main/error.html"

#crear arbre de directoris
cd /var/www
mkdir projecteinfovj.com
cd projecteinfovj.com
mkdir html
mkdir logs
cd logs

# Install DHCP
sudo apt install apache2

# Download GitHub configuration file
wget $f_web_conf
wget $f_portada
wget $f_error


# Copy the configuration file to /etc/dhcp directory
sudo cp www.projecteinfovj.com.conf /etc/apache2/sites-available
a2ensite www.projecteinfovj.com.conf
sudo cp portada.html /var/www/projecteinfovj.com/html
sudo cp error.html /var/www/projecteinfovj.com/html

a2ensite www.projecteinfovj.com.conf
a2dissite 000_default.conf

# Restart the DHCP server
sudo systemctl restart apache2
