# Use Amazon Linux base image
FROM amazonlinux:2023

# Install necessary packages for PHP
RUN yum install -y tar gzip make gcc libxml2-devel bzip2-devel curl-devel readline-devel libxslt-devel && \
    curl -O https://www.php.net/distributions/php-7.3.33.tar.gz && \
    tar -zxvf php-7.3.33.tar.gz && \
    cd php-7.3.33 && \
    ./configure --with-bz2 --enable-calendar --with-curl --enable-exif --enable-ftp --with-gettext --enable-mbstring --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-pcntl --with-readline --enable-sockets --enable-wddx --with-xmlrpc --with-xsl --with-zlib --disable-fileinfo && \
    make && make install && \
    cd .. && rm -rf php-7.3.33 php-7.3.33.tar.gz && \
    php -v

# Copy your PHP application files into the container
COPY . /var/www/html/

# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache web server when the container starts
CMD sleep 600 && php -S 0.0.0.0:80 index.php


