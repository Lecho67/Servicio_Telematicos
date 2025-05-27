FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      apache2 \
      openssl \
      libapache2-mod-wsgi-py3 \
      python3 \
      python3-pip && \
    a2enmod ssl proxy proxy_http headers wsgi && \
    rm -rf /var/lib/apt/lists/*

# 1) Copiamos tu VirtualHost personalizado como webapp.conf
COPY webapp.conf /etc/apache2/sites-available/webapp.conf

# 2) Deshabilitamos el 000-default y habilitamos webapp.conf
RUN a2dissite 000-default.conf && \
    a2ensite webapp.conf

# 3) Eliminamos el index por defecto (precaución: asegúrate que exista el nuevo)
RUN rm -f /var/www/html/index.html

# 4) Copiamos el nuevo index.html
COPY index.html /var/www/html/index.html

# 5) Certificados
COPY certs/apache-selfsigned.crt /etc/ssl/certs/apache-selfsigned.crt
COPY certs/apache-selfsigned.key  /etc/ssl/private/apache-selfsigned.key

# Exponemos puertos HTTP y HTTPS
EXPOSE 80 443

CMD ["apache2ctl", "-D", "FOREGROUND"]
