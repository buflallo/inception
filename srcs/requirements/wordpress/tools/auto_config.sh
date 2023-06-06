#!/bin/bash

alias wp='/usr/local/bin/wp-cli.phar'

wp core config --allow-root --path='/var/www/html/' --dbname='TEST' --dbuser='test' --dbpass='Hanajay' --dbhost='mariadb' --dbprefix='wp_';

wp core install --allow-root --path='/var/www/html/' --url='localhost' --title='Blog Title' --admin_user='adminuser' --admin_password='password' --admin_email='email@example.com';

wp user create --allow-root --path='/var/www/html/' hlachkar bob@example.com --role=author --user_pass=Hanajay;

sleep 5;
exec "$@"