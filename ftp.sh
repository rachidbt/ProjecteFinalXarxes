#!/bin/bash

usuari=$1
password=$1
sudo useradd -g ftp -d /var/www/html/$usuari -p $(openssl passwd -crypt $password) --shell=/bin/false $usuari
# sudo mkdir /var/www/html/$usuari
