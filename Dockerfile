FROM phpswoole/swoole:php8.3-alpine

RUN apt-get update && apt-get install -y zip libaio1 git wget composer

# 使用 php docker 推荐的 php-extension-installer 安装扩展
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

############################## 根据需要启用要安装的扩展
RUN install-php-extensions \
# amqp \
# apcu \
# apcu_bc \
bcmath \
# bz2 \
# calendar \
# cmark \
# dba \
# decimal \
# enchant \
# exif \
# >=php7.4
# ffi \
gd \
gettext \
# gmagick \# 
# gmp \
# grpc \
# http \
# igbinary \
imagick \
# imap \
# interbase \
# intl \
# ldap \
# mailparse \
mcrypt \
# memcache \
# memcached \
# mongo \
# mongodb \
# msgpack \
# <=php5.6
# mssql \
# <=php5.6
# mysql \
# mysqli \
# oauth \
# odbc \
# opcache \
# opencensus \
# parallel \
# pcntl \
# pcov \
# pdo_dblib \
# pdo_firebird \
# pdo_mysql \
# pdo_odbc \
# pdo_pgsql \
# <=php7.4
# pdo_sqlsrv  \
# pgsql \
# propro \
# protobuf \
# pspell \
# <=php7.0
# pthreads \
# raphf \
# <=php7.4
# rdkafka \
# <=php7.3
# recode \
# redis \
# shmop \
# snmp \
# snuffleupagus \
# soap \
# sockets \
# solr \
# sqlsrv \
# ssh2 \
# <=php5.6
# sybase_ct \
# sysvmsg \
# sysvsem \
# sysvshm \
# tdlib \
# tidy \
# timezonedb \
# uopz \
uuid \
# wddx \
# xdebug \
# xhprof \
# xmlrpc \
# xsl \
# yaml \
zip
# zookeeper


# 指定安装版本
ENV BE_VERSION = ''


ADD start.sh /root/start.sh

ENTRYPOINT sh /root/start.sh 
