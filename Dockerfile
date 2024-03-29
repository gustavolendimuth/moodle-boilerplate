# Usar a imagem oficial do PHP 8 com Apache
FROM php:8.0-apache

# Instalar dependências do sistema e extensões PHP necessárias pelo Moodle 4
RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libpq-dev libxml2-dev libzip-dev zlib1g-dev libicu-dev g++ libonig-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli intl soap zip exif opcache

# Configurar o OPcache para melhorar o desempenho
RUN echo 'opcache.enable=1' >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo 'opcache.interned_strings_buffer=8' >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo 'opcache.max_accelerated_files=10000' >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo 'opcache.memory_consumption=128' >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo 'opcache.save_comments=1' >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    echo 'opcache.revalidate_freq=1' >> /usr/local/etc/php/conf.d/opcache-recommended.ini

# Ajustar max_input_vars para atender às necessidades do Moodle
RUN echo 'max_input_vars=5000' >> /usr/local/etc/php/conf.d/custom.ini

# Baixar a última versão do Moodle 4
RUN curl -L https://download.moodle.org/download.php/direct/stable403/moodle-latest-403.tgz --output moodle.tgz \
    && tar -xzvf moodle.tgz -C /var/www/html --strip-components=1 \
    && rm moodle.tgz

# Criar diretório de dados do Moodle e ajustar permissões
RUN mkdir /var/www/moodledata && \
    chown -R www-data:www-data /var/www && \
    chmod -R 777 /var/www/moodledata

# Expor porta 80
EXPOSE 80