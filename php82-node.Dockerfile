## Use Alpine as the base image
#FROM alpine
#
## Set environment variables
#ENV PHP_VERSION=82
#
## Update and upgrade installed packages
#RUN apk update && apk upgrade
#
#RUN apk add git
#
## Install PHP and necessary extensions
#RUN apk add --no-cache php${PHP_VERSION} php${PHP_VERSION}-bcmath php${PHP_VERSION}-ctype php${PHP_VERSION}-curl \
#    php${PHP_VERSION}-dom php${PHP_VERSION}-json php${PHP_VERSION}-mbstring \
#    php${PHP_VERSION}-openssl php${PHP_VERSION}-pdo php${PHP_VERSION}-pdo_mysql \
#    php${PHP_VERSION}-tokenizer php${PHP_VERSION}-xml php${PHP_VERSION}-xmlwriter \
#    php${PHP_VERSION}-zip php${PHP_VERSION}-pecl-redis php${PHP_VERSION}-phar php${PHP_VERSION}-fpm \
#    php${PHP_VERSION}-simplexml php${PHP_VERSION}-fileinfo php${PHP_VERSION}-xmlreader \
#    php${PHP_VERSION}-gd php${PHP_VERSION}-iconv php${PHP_VERSION}-pgsql
#
## Create php symbolic link for php${PHP_VERSION}
#RUN ln -s /usr/bin/php${PHP_VERSION} /usr/bin/php
#
## install nodejs
#RUN apk add --no-cache nodejs
#
## install npm
#RUN apk add --no-cache npm
#
## Install glibc to run Bun
#RUN if [[ $(uname -m) == "aarch64" ]] ; \
#    then \
#    # aarch64
#    wget https://raw.githubusercontent.com/squishyu/alpine-pkg-glibc-aarch64-bin/master/glibc-2.26-r1.apk ; \
#    apk add --no-cache --allow-untrusted --force-overwrite glibc-2.26-r1.apk ; \
#    rm glibc-2.26-r1.apk ; \
#    else \
#    # x86_64
#    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk ; \
#    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub ; \
#    apk add --no-cache --force-overwrite glibc-2.28-r0.apk ; \
#    rm glibc-2.28-r0.apk ; \
#    fi
## Install Bun
#RUN npm install -g bun
#
## Install Composer
#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
#    && php -r "unlink('composer-setup.php');"
#
#RUN alias composer="php /usr/local/bin/composer"
#
## Display installed versions
#RUN php -v && composer --version && node -v && npm -v

FROM phpdockerio/php:8.2-cli

RUN mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \
        php8.2-bcmath \
        php8.2-gd \
        php8.2-pgsql \
        nodejs

RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN curl -fsSL https://bun.sh/install | BUN_INSTALL=/usr bash
