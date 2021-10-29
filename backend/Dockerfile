FROM php:7.3-apache

#####################################
# ENV Vars
#####################################
ENV COMPOSER_MEMORY_LIMIT='-1'

#####################################
# PHP Extensions
#####################################
RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
        libmemcached-dev \
        libzip-dev \
        libz-dev \
        libzip-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libldap2-dev \
        sendmail \
        openssh-server \
        libmagickwand-dev \
        git \
        cron \
        nano \
        libxml2-dev \
        libreadline-dev \
        libgmp-dev \
        mariadb-client
        
#####################################
# PHP Extensions
#####################################
RUN docker-php-ext-install soap \
    exif \
    pcntl \ 
    zip \
    pdo_mysql \
    pdo_pgsql \
    mysqli \
    bcmath \
    intl \
    gmp

#####################################
# xDebug:
#####################################
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

#####################################
# PHP LDAP Support
#####################################
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap

#####################################
# PHP Redis
#####################################
RUN pecl install redis && \
    docker-php-ext-enable redis

#####################################
# MHSendmail (mailhog)
#####################################
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail

#####################################
# Imagick:
#####################################
RUN pecl install imagick && \
    docker-php-ext-enable imagick

#####################################
# GD:
#####################################
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

#####################################
# WP-CLI
#####################################
WORKDIR /tmp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#####################################
# Composer
#####################################
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#####################################
# Set Working Directory / Root
#####################################
WORKDIR /var/www/html
RUN mkdir /var/www/html/public

#####################################
# Run Composer Install
#####################################
COPY . ./
RUN --mount=type=cache,target=/tmp/cache composer install --prefer-dist

#####################################
# Restart Apache with Mounted Config
#####################################
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf &&\
    a2enmod rewrite &&\
    service apache2 restart

#####################################
# Start 
#####################################
EXPOSE 80