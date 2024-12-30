FROM php:7.4-apache

# Installer les extensions nécessaires
RUN docker-php-ext-install pdo pdo_mysql

# Copier les fichiers PHP
COPY ./php /var/www/html

# Configurer les permissions
RUN chown -R www-data:www-data /var/www/html

# Redémarrer Apache
CMD ["apache2-foreground"]
