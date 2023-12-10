#!/bin/sh


if [ ! -d /data/www ]; then
	mkdir -p /data/www
fi


if [ ! "$(ls -A /data/www)" ]; then
	# 代码目录为空，创建项目
	cd /root/
	composer create-project be/new
	cp -rf new/* /data/www
	rm -rf new
		
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

