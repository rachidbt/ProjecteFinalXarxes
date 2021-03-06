#!/bin/bash

if [ -z $1 ]
then
echo "Debe ingresar el nombre del dominio"
exit 1
else
DOMINIO=$1
fi

echo "Configurando dominio "$DOMINIO

#CREAMOS LA ENTRADA EN /ETC/HOSTS
echo "192.168.3.221"$DOMINIO >> /etc/hosts

#AGREGAMOS EL VIRTUAL HOST
echo "<VirtualHost *:80>
ServerAdmin admin@$DOMINIO
ServerName  www.$DOMINIO
Redirect / https://www.$DOMINIO/
ServerAlias $DOMINIO

DocumentRoot /var/www/$DOMINIO/
<Directory />
Options FollowSymLinks
AllowOverride All
</Directory>
<Directory /var/www/$DOMINIO/>
AllowOverride All
Order allow,deny
allow from all
</Directory>

SSLEngine on
SSLCertificateFile /home/$USER/mydomain.crt
SSLCertificateKeyFile /home/$USER/mydomain.key

</VirtualHost>" >> /etc/apache2/sites-available/$DOMINIO.conf

#CREAMOS EL DIRECTORIO PARA EL DOMINIO
sudo chmod -R 755 /var/www
mkdir /var/www/$DOMINIO
chmod 775 /var/www/$DOMINIO
cp /var/www/html/index.html /var/www/$DOMINIO/

#CONFIGURAMOS APACHE
a2ensite $DOMINIO

#REINICIAMOS APACHE
/etc/init.d/apache2 reload

echo "Listo!"
