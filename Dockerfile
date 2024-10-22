# Используем базовый образ с PHP и необходимыми модулями
FROM php:8.1-fpm

# Устанавливаем необходимые пакеты и зависимости
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libmcrypt-dev \
    libxml2-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    zip \
    git \
    && docker-php-ext-install pdo pdo_mysql mysqli opcache zip \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd \
    && apt-get clean

# Настраиваем директории для nginx и PHP-FPM
RUN mkdir -p /var/www

# Переходим в директорию с сайтами и скачиваем bitrixsetup.php
WORKDIR /var/www
