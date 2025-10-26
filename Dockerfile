FROM php:8.3-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    make \
    # libpcre-dev \
    libssl-dev \
    zlib1g-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Install ekstensi PHP yang diperlukan untuk Phalcon
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    opcache \
    sockets \
    zip \
    gd \
    bcmath \
    mbstring

RUN pecl install psr \
&& docker-php-ext-enable psr
# Install Phalcon 4 (versi stabil terakhir untuk PHP 7.3)
RUN cd /tmp \
    && git clone --depth=1 -b v5.9.0 https://github.com/phalcon/cphalcon.git \
    && cd cphalcon/build \
    && ./install \
    && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure Apache
RUN a2enmod rewrite
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html

COPY docker/apache/phalcon.conf /etc/apache2/sites-available/000-default.conf

# Copy PHP configuration
COPY docker/php/php.ini /usr/local/etc/php/conf.d/php-custom.ini

# Copy application files

# Set correct permissions
RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data \
    && mkdir -p /var/www/html/storage/cache \
    && mkdir -p /var/www/html/storage/logs \
    && mkdir -p /var/www/html/storage/sessions \
    && chown -R www-data:www-data /var/www/html/storage \
    && chmod -R 775 /var/www/html/storage

COPY . .

# Install composer dependencies if exists
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update --1
RUN if [ -f "composer.json" ]; then composer install ; fi

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod +x /var/www/html/scripts/*.sh 2>/dev/null || true

EXPOSE 80