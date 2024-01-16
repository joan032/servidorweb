#!/bin/bash

# Variables
GITHUB_REPO="https://github.com/joan032/servidorweb.git"
ARCHIVE_NAME="backup_projecteinfovj.com20240116_152247.tar.gz"
WEB_CONFIG_FILE="www.projecteinfovj.com.conf"
WEB_ROOT="/var/www"
# SERVER_CONFIG_DIR="/etc/apache2/sites-available"

# Instalar y configurar el servidor web (puedes necesitar ajustar esto según tu servidor web)
# Por ejemplo, si estás utilizando Apache
sudo apt-get install apache2
sudo systemctl restart apache2

# Descargar el archivo tar.gz desde GitHub
wget "$GITHUB_REPO/archive/$ARCHIVE_NAME"

# Descomprimir el archivo tar.gz
tar -zxvf "$ARCHIVE_NAME" -C /tmp/

# Mover archivos a la ubicación del servidor web
mv "$ARCHIVE_NAME/" "$WEB_ROOT"

# Copiar el archivo de configuración del servidor web
cp "$WEB_CONFIG_FILE" "/etc/apache2/sites-available"
a2ensite "$WEB_CONFIG_FILE"
a2dissite "000-default.conf"

echo "Instalación completada."
