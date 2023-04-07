FROM debian:buster

EXPOSE 3306

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY conf/mysql.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/mysql_db.conf /var/www/mysql_db.conf

RUN service mysql start && mysql < /var/www/mysql_db.conf;

CMD mysqld
