FROM php:5.6-fpm

RUN apt-get update
RUN apt-get install -y unzip libaio-dev php5-dev
RUN apt-get clean -y

RUN echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/oci8.so" | /usr/local/etc/php/php.ini
RUN echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/oci8.so" | /etc/php5/cli/php.ini

# Oracle instantclient
ADD instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/
ADD instantclient-sdk-linux.x64-12.1.0.2.0.zip /tmp/
ADD instantclient-sqlplus-linux.x64-12.1.0.2.0.zip /tmp/

RUN unzip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /usr/local/
RUN unzip /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /usr/local/
RUN unzip /tmp/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip -d /usr/local/
RUN ln -s /usr/local/instantclient_12_1 /usr/local/instantclient
RUN ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so
RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus
RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8-2.0.12
