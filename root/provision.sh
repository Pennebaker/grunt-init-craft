#!/bin/bash

php_config_file="/etc/php5/apache2/php.ini"
xdebug_config_file="/etc/php5/mods-available/xdebug.ini"
mysql_config_file="/etc/mysql/my.cnf"
mysql_db="vagrant"
mysql_pass="vagrant"

# Set Locale
echo "Setting locales..."
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8 > /dev/null
dpkg-reconfigure locales > /dev/null

IPADDR=$(/sbin/ifconfig eth0 | awk '/inet / { print $2 }' | sed 's/addr://')
echo $IPADDR ubuntu.localhost >> /etc/hosts			# Just to quiet down some error messages

# Update the server
echo "Updating Server..."
apt-get update > /dev/null
echo "Upgrading Software..."
apt-get -y upgrade > /dev/null

# Install basic tools
echo "Installing basic tools..."
apt-get -y install build-essential binutils-doc git > /dev/null

# Install Apache
echo "Installing Apache..."
apt-get -y install apache2 > /dev/null
echo "Installing PHP..."
apt-get -y install php5 php5-curl php5-mysql php5-sqlite php5-xdebug &> /dev/null

sed -i "s/display_startup_errors = Off/display_startup_errors = On/g" ${php_config_file}
sed -i "s/display_errors = Off/display_errors = On/g" ${php_config_file}
echo "xdebug.remote_enable=On" >> ${xdebug_config_file}
echo 'xdebug.remote_connect_back=On' >> ${xdebug_config_file}

# Install MySQL
echo "mysql-server mysql-server/root_password password ${mysql_pass}" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${mysql_pass}" | sudo debconf-set-selections
echo "Installing MySQL..."
apt-get -y install mysql-client mysql-server > /dev/null

sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" ${mysql_config_file}

# Create craft database
echo "Creating database with name $mysql_db..."
mysql -u root -p${mysql_pass} -e "create database $mysql_db; grant all on $mysql_db.* to 'root' identified by '${mysql_pass}'; flush privileges;" &> /dev/null

# Allow root access from any host
echo "Granting access to database..."
mysql -u root -p${mysql_pass} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION" &> /dev/null
mysql -u root -p${mysql_pass} -e "GRANT PROXY ON ''@'' TO 'root'@'%' WITH GRANT OPTION" &> /dev/null

# Restore Database from dump
mysql -u root -p$mysql_pass $mysql_db < /vagrant/data/dev.sql && echo "Restoring MySQL Database from dump.sql..."

# Simplify Apache permissions
echo "export APACHE_RUN_USER=vagrant" >> /etc/apache2/envvars
echo "export APACHE_RUN_GROUP=vagrant" >> /etc/apache2/envvars

# AllowOverride
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
echo "Enabling module rewrite..."
a2enmod rewrite > /dev/null

# Install Mcrypt
echo "Installing MCrypt..."
apt-get -y install mcrypt php5-mcrypt > /dev/null
php5enmod mcrypt

# Install ImageMagick
echo "Installing Imagick..."
apt-get -y install imagemagick php5-imagick &> /dev/null

# Restart Services
echo "Restarting Services..."
service apache2 restart > /dev/null
service mysql restart > /dev/null

# Database auto dump
echo "alias database_dump='mysqldump -u root -pvagrant --skip-dump-date vagrant > /vagrant/data/dev.sql'" >> /home/vagrant/.bashrc
echo 'nohup watch -n5 "mysqldump -u root -pvagrant --skip-dump-date vagrant > /vagrant/data/dev.sql" > /dev/null 2>&1 &' > /etc/rc.local
echo 'exit 0' >> /etc/rc.local
