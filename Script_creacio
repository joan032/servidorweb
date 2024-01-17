#!/bin/bash

#deim quina aplicació volem fer la còpia
read -p "Tria la aplicacio " app_name

# Directori on hi ha l’aplicació
app_directory="/var/www/$app_name"

# agafar l’arxiu de configuració
apache_config="/etc/apache2/sites-available/www.$app_name.conf"

# on guard les còpies
backup_directory="/Copies"

#posar nom al zip
backup_filename="backup_$app_name$.tar.gz"

#si no hi ha la carpeta de copies es crea 
mkdir -p $backup_directory

#fer la copia i comprimir amb zip
cp "$apache_config" $backup_directory
tar -czf $backup_directory/$backup_filename -C $app_directory .
echo "Copia de seguretat completada"
