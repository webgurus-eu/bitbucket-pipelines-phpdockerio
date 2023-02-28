FROM phpdockerio/php:8.1-cli

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \
        php8.1-bcmath \
        php8.1-gd \
        php8.1-pgsql; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*