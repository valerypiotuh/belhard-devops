                                                   
# 07.Nginx

##### Задание:

- команды из 07.NGINX/:
```sh
$docker build . -f ./dockernginx1/Dockerfile_1 -t nginx1
$docker build . -f ./dockernginx2/Dockerfile_2 -t nginx2
$docker run -d --rm --name nginx_1 -p 8101:80 nginx1
$docker run -d --rm --name nginx_2 -p 8201:80 nginx2
```

- настройки /etc/nginx/sites-available/default
```sh
server {
        listen 8000 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files $uri $uri/ =404;
        }
}
```

- настройки /etc/nginx/sites-available/nginx_docker.conf
```sh
server {
 listen 8100;
            location / {
               proxy_set_header Host $host;
               proxy_set_header X-Real-IP $remote_addr;
               proxy_pass http://127.0.0.1:8101;
            }
}
server {
 listen 8200;
            location / {
               proxy_set_header Host $host;
               proxy_set_header X-Real-IP $remote_addr;
               proxy_pass http://127.0.0.1:8201;
            }
}
upstream backend {
        server 127.0.0.1:8100 weight=10;
        server 127.0.0.1:8200 weight=5;
        }
 server {
        listen 8300;
        location / {
        proxy_pass http://backend;
                   }
        }
```

- настраиваем поброс портов в NAT VMware Workstation 8100 на 8100 ip VM
- в браузере 127.0.0.1:8000 8100 8200 8300 - всё гуд =) вроде как, должно

##### Дополнительно
____

- срипт для теста балансира 8300 (1 аргумент = количество curl) ./testbalans.sh 15
```sh
#!/bin/bash
i="$1"
test="Page first Docker"
while [ $i -gt 0 ];
do
  i=$[ $i - 1 ];
  a="$(curl -s 127.0.0.1:8300)"
  echo "$a"
  if [ "$a" = "$test" ];
  then w10=$(( $w10 + 1 )) # можно и []
        else w5=$(( $w5 + 1 ))
  fi
done
echo "8100 = $w10"
echo "8200 = $w5"
```

- ну и docker-compose -d up

