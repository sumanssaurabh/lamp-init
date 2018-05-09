#!/bin/bash
PASSWORD=
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#Apache
echo -e "Installing Apache\n"
apt update
apt install -y apache2

#MYSQL
echo -e "Installing Mysql\n"
DEBIAN_FRONTEND=noninteractive apt install mysql-server -y
#Run the MySQL Secure Installation wizard
mysql_secure_installation <<EOF
y
0
$PASSWORD
$PASSWORD
y
y
y
y
y
EOF
#PHP
echo -e "Installing PHP"
apt install -y php libapache2-mod-php php-mysql
#installing php-extensions
apt install -y php-cli php-common php-xml php-gd \
php-curl php-mbstring php-xmlrpc \
php-imagick php-pspell php-imap