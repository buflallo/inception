FROM debian:buster

EXPOSE 9000

RUN apt update -y && apt upgrade -y && apt-get install -y wget php7.3\
 php-fpm7.3\
 php-mysql\
 mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/auto_config.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

#ENTRYPOINT [ "sh","/tmp/setup.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
