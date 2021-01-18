#bin/bash

username=$1
password=$1
dbname=$2

echo "create user $username@localhost identified by '$password';" >> mysql.txt
echo "create database $dbname;" >> mysql.txt
echo "grant select, delete, update, insert, create, drop, alter on $dbname.* to $username@localhost;" >> mysql.txt
echo "flush privileges;" >> mysql.txt
sudo mysql < mysql.txt
rm mysql.txt
