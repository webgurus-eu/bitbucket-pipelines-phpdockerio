FROM phpdockerio/php:8.2-cli

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \
        php8.2-bcmath \
        php8.2-gd \
        php8.2-pgsql; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*