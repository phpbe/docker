#!/bin/sh


if [ ! -d /data/www ]; then
	mkdir -p /data/www
fi


if [ ! "$(ls -A /data/www)" ]; then
	
	# 代码目录为空，下载代码
	cd /root/
	if [ $BE_VERSION = "" ]; then
		git clone https://github.com/phpbe/be.git
		cp be/server.php /data/www/server.php
		cp be/composer.json /data/www/composer.json
		rm -rf be
	else
		wget https://github.com/phpbe/be/archive/refs/tags/$BE_VERSION.tar.gz
		tar -zxvf $BE_VERSION.tar.gz
		cp $BE_VERSION/server.php /data/www/server.php
		cp $BE_VERSION/composer.json /data/www/composer.json
		rm -rf $BE_VERSION $BE_VERSION.tar.gz
	fi
	
	# composer 更新拉取 vendor 库
	if [ -f /data/www/composer.json ]; then
		cd /data/www
		composer update
	fi
		
	if [ ! -d /data/www/data ]; then
		mkdir /data/www/data
	fi
	chmod -R 777 /data/www/data
	
	if [ ! -d /data/www/www ]; then
		mkdir /data/www/data
	fi
	chmod -R 777 /data/www/www
fi


cd /data/www
php server.php start

