#!/usr/bin/bash
# Script de creacio de una zona dns amb el nom de domini

# $1 == nom del domini
# $2 == entrada de pagina web
# $3 == entrada de correu

# Afegir la zona dins l'arxiu named.conf.local
ip=`hostname -I`

echo "zone \"$1\" {" >> /etc/bind/named.conf.local
echo -e "\ttype master;" >> /etc/bind/named.conf.local
echo -e "\tfile \"/etc/bind/db.$1\";" >> /etc/bind/named.conf.local
echo "};" >> /etc/bind/named.conf.local

# Copiar la plantilla de db.local al nom del domini

cp /etc/bind/db.local /etc/bind/db.$1

# Canviar el nom del domini dins l'arxiu

sed -i "s/localhost/$1/g" /etc/bind/db.$1

# Eliminar entrada de ipv6 i entrada de loopback

sed -i "13,14 d" /etc/bind/db.$1
sed -i "12 d" /etc/bind/db.$1

# Entrada de dns

echo -e "@\tIN\tNS\tns.$1." >> /etc/bind/db.$1
echo -e "ns\tIN\tA\t$ip" >> /etc/bind/db.$1

# Entrada de pagina web

if [ "$2" -eq 1 ];
then
	echo -e "www\tIN\tA\t$ip" >> /etc/bind/db.$1
fi

# Entrada de correu

if [ "$3" -eq 1 ];
then
        echo -e "@\tIN\tMX  1   mail.$1." >> /etc/bind/db.$1
	echo -e "mail\tIN\tA\t$ip" >> /etc/bind/db.$1
fi
