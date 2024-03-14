#!/bin/bash

# Moodle 4.3 Required PHP Extensions Installer and Configuration Script
# Adjust the version of PHP (8.2) as needed.

PHP_VERSION=8.2
PHP_INI_PATH="/etc/php/$PHP_VERSION/apache2/php.ini"

echo "--> Updating package lists..."
sudo apt-get update

echo "--> Installing PHP and required extensions for Moodle 4.3..."
sudo apt-get install -y php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-curl php$PHP_VERSION-xml php$PHP_VERSION-soap php$PHP_VERSION-mbstring php$PHP_VERSION-zip php$PHP_VERSION-gd php$PHP_VERSION-intl php$PHP_VERSION-xmlrpc php$PHP_VERSION-pgsql php$PHP_VERSION-mysql

echo "--> Setting max_input_vars to 5000..."
sudo sed -i "s/;max_input_vars = .*/max_input_vars = 5000/" $PHP_INI_PATH

echo "--> Restarting Apache to apply changes..."
sudo systemctl restart apache2

echo "--> Installation and configuration completed."
