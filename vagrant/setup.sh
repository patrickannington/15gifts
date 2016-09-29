#!/usr/bin/env bash

# Attain super user privs
sudo su

# Update the package sources
apt-get update

# Install apache
apt-get install -y apache2

# We'll not need this directory, so might as well keep clean
rm -rf /var/www

# Install curl and git (standard setup packages)
apt-get install curl -y
apt-get install git -y

# Create a syblink dir for the webapp
ln -fs /15gifts/htdocs /var/www

# Install php5 packages and modules
apt-get -y install php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql

# We need mod_rewrite on
a2enmod rewrite headers

# As this server isn't shared, we'll want to be able to override all directives
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

# Ensure error reporting is off
sed -i "s/error_reporting = .*/error_reporting = ^E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = Off/" /etc/php5/apache2/php.ini

# Add our vhost conf
cat > /etc/apache2/sites-enabled/15gifts.conf << "EOF"
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName 15gifts
    ServerAlias 192.168.33.10
    DocumentRoot /var/www
    <Directory /var/www>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    LogLevel warn
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SetEnv ROOT_DIRECTORY /15gifts/htdocs
</VirtualHost>

EOF

# We don't need the default site conf, so remove
rm /etc/apache2/sites-enabled/000-default.conf

# The following allows mysql to be installed without user input
echo "mysql-server-5.5 mysql-server/root_password password 15g1ft5£" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password 15g1ft5£" | debconf-set-selections

# Install mysql server and php module
apt-get -y install mysql-server-5.5 libapache2-mod-auth-mysql php5-mysql

# Run the user creation, database creation and population script
mysql -uroot -p15g1ft5£ < /15gifts/htdocs/createDb.sql

# Restart mysql and apache
service mysql restart
service apache2 restart
