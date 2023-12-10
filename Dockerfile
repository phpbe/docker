FROM phpswoole/swoole:5.1.1-php8.3


ADD start.sh /root/start.sh
ENTRYPOINT sh /root/start.sh 
