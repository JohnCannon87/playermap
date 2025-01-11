# Use the official PHP image as a parent image
FROM php:8.0-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html/

# Install any needed packages and enable Apache mod_rewrite
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli && a2enmod rewrite

# Expose port 80
EXPOSE 80

# Define a volume for the config directory
VOLUME ["/var/www/html/config"]

# Start Apache in the foreground
CMD ["apache2-foreground"]
