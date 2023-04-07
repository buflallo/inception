FROM debian:buster

# Install Nginx and OpenSSL
RUN apt-get update && \
    apt-get install -y nginx vim curl openssl && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /etc/nginx/ssl && mkdir /etc/nginx/ssl/private && mkdir /etc/nginx/ssl/certs

# Generate self-signed SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/nginx-selfsigned.key \
    -out /etc/nginx/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=MA/ST=Merrakech/L=Benguerir/O=UM6P/OU=IT/CN=hlachkar.42.fr"

# Copy nginx.conf file to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/html
# Expose ports 80 and 443
EXPOSE 80 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
