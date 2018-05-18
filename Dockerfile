FROM php:7.1

# Install some extensions
# @see https://hub.docker.com/r/_/php/ 'How to install more PHP extensions'

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libgmp-dev \
        re2c libmhash-dev \
        libmcrypt-dev \
        file \
        zlib1g-dev \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/ \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure gmp \
    && docker-php-ext-install gmp \
    && docker-php-ext-install zip

# Link Composer
# @see https://github.com/docker-library/php/issues/344#issuecomment-364843883

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
