user=$1
passwd=$2
data=`date +%s`
usuari=$user$data

useradd $usuari -m
sed -i "s/!/$passwd/g" /etc/shadow
sed -i "s/mydestination=/mydestination= $user.com, /g" /etc/postfix/main.cf
