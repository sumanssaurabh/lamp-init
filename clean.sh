#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

export DEBIAN_FRONTEND=noninteractive
#Apache
echo -e "Removing Apache"
apt remove -y apache2 

#MYSQL
echo -e "Removing MYSQL"
apt-get remove -y mysql-*
apt-get purge -y mysql-*

#PHP
apt remove -y php libapache2-mod-php php-mysql \
php-cli php-common php-xml php-gd \
php-curl php-mbstring php-xmlrpc \
php-imagick php-pspell php-imap
apt autoremove -y
apt autoclean -y
