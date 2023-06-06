FROM debian:buster

EXPOSE 9000

RUN apt update -y && apt upgrade -y && apt-get install -y wget php7.4\
 php-fpm\
 php-mysql\
 mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN mv /var/www/wordpress /var/www/html
RUN	chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/php/
COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/

COPY ./tools/auto_config.sh /tmp/

RUN chmod +x /tmp/auto_config.sh

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh


ENTRYPOINT ["/tmp/auto_config.sh" ]
CMD ["/usr/sbin/php-fpm7.4","-F"]

