FROM phpswoole/swoole:5.1.1-php8.3

RUN apt-get update && apt-get install -y git wget


# 指定安装版本
ENV BE_VERSION=''


ADD start.sh /root/start.sh
ENTRYPOINT sh /root/start.sh 
