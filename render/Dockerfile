# ============================================================
# Magento 2 Dockerfile voor Render (Single Container)
# ============================================================

FROM php:8.2-fpm

# -----------------------------
# Systeem dependencies
# -----------------------------
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    libxml2-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxslt1-dev \
    procps \
    nano \
    && docker-php-ext-configure gd \
         --with-freetype \
         --with-jpeg \
    && docker-php-ext-install intl xsl zip soap bcmath pdo_mysql gd ftp sockets

# -----------------------------
# Composer installeren
# -----------------------------
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# -----------------------------
# Magento directory
# -----------------------------
WORKDIR /var/www/html

# -----------------------------
# Nginx configuratie
# -----------------------------
RUN rm -f /etc/nginx/sites-enabled/default

COPY nginx.conf /etc/nginx/conf.d/default.conf

# -----------------------------
# PHP configuratie
# -----------------------------
RUN echo "memory_limit=2G" > /usr/local/etc/php/conf.d/memory.ini \
    && echo "max_execution_time=300" >> /usr/local/etc/php/conf.d/memory.ini

# -----------------------------
# Installatie scripts toevoegen
# -----------------------------
COPY install-magento.sh /usr/local/bin/install-magento
RUN chmod +x /usr/local/bin/install-magento

# -----------------------------
# Start script
# -----------------------------
COPY start.sh /usr/local/bin/start-server
RUN chmod +x /usr/local/bin/start-server

EXPOSE 80

CMD ["start-server"]
