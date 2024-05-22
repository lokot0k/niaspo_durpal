FROM php:7.4-apache

RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libpq-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-jpeg=/usr/include/ && \
    docker-php-ext-install gd pdo pdo_mysql pdo_pgsql

RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/
CMD ["apache2-foreground"]
