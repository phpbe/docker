#!/bin/sh


if [ ! -d /data/www ]; then
	mkdir /data/www
fi


if [ ! "$(ls -a /data/www)" ]; then
	
	# 代码目录为空，下载代码
	cd /data
	if [ $BE_VERSION = "" ]; then
		git clone https://github.com/phpbe/be.git
		cp -rf be/* /data/www
		rm -rf be
	else
		wget https://github.com/phpbe/be/archive/refs/tags/$BE_VERSION.tar.gz
		tar -zxvf $BE_VERSION.tar.gz
		cp -rf $BE_VERSION/* /data/www
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

