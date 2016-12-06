# oci8-install
Installation requirements for php oci8 driver for ubuntu 14.04 trusty

### Install
Via docker:
```
docker build -t <your_name>/php -f Dockerfile
docker-compose up -d
```
or bash:
```
apt-get update
apt-get install -y unzip libaio-dev php5-dev
apt-get clean -y
unzip instantclient-basic-linux.x64-12.1.0.2.0.zip -d /usr/local/
unzip instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /usr/local/
unzip instantclient-sqlplus-linux.x64-12.1.0.2.0.zip -d /usr/local/
ln -s /usr/local/instantclient_12_1 /usr/local/instantclient
ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so
ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus
echo 'instantclient,/usr/local/instantclient' | pecl install oci8-2.0.12
```
And do not forget to add
```
extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/oci8.so
```
into your `php.ini` file.
