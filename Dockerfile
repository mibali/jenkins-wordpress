FROM wordpress:latest

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
  && docker-php-ext-install -j$(nproc) iconv \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd

# Copy the WordPress configuration file
COPY wp-config.php /var/www/html/

# Set the WordPress files ownership to the www-data user
RUN chown -R www-data:www-data /var/www/html/
