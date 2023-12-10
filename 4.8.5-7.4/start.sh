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
		mkdir -p /data/www/data
		chmod -R 777 /data/www/data
	fi
	
	if [ ! -d /data/www/www ]; then
		mkdir -p /data/www/data
		chmod -R 777 /data/www/www
	fi
fi



if [ ${MYSQL-SERVER} ]; then
	# 安装本机 MySQL
	echo '安装本机 MySQL'
	apt-get install mysql-server
	
	if [ ! -d /data/mysql/data ]; then
		mkdir -p /data/mysql/data
		chmod -R 777 /data/mysql/data
	fi
				
	if [ ! -d /data/mysql/conf ]; then
		mkdir -p /data/mysql/conf
	fi
	
fi



if [ ${REDIS-SERVER} ]; then

	if [ ! -f /etc/init.d/redis-server ]; then
	
		echo '安装本机 REDIS'
		# 安装本机 REDIS
		apt-get update
		apt-get install -y lsb-release curl gpg
		curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
		echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list
		apt-get update
		apt-get install -y redis
	fi

	if [ ! -d /data/redis/data ]; then
		mkdir -p /data/redis/data
		chmod -R 777 /data/redis/data
	fi
				
	if [ ! -d /data/redis/conf ]; then
		mkdir -p /data/redis/conf
	fi
	
	if [ ! -f /data/redis/conf/redis.conf ]; then
		cp /etc/redis/redis.conf /data/redis/conf/redis.conf
	fi

	/etc/init.d/redis-server /data/redis/conf/redis.conf --daemonize yes
fi


cd /data/www
php server.php start

