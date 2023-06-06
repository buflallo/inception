#!/bin/bash
service mysql start;
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`TEST\`;"
mysql -uroot -e "CREATE USER IF NOT EXISTS \`test\`@'%' IDENTIFIED BY 'Hanajay';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON \`TEST\`.* TO \`test\`@'%' IDENTIFIED BY 'Hanajay';"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('Hanajay')"
sleep 3
mysqladmin -u root -pHanajay shutdown
exec mysqld_safe
