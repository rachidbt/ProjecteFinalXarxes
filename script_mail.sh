user=$1
passwd=$2
domini=$3

useradd $user -m
sed -i "s/!/$passwd/g" /etc/shadow
sed -i "s/mydestination=/mydestination= $domini.com, /g" /etc/postfix/main.cf
