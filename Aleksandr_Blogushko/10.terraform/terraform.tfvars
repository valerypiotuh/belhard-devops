speedtest_image = "shadejant/speedtest:latest"
speedtest_container_name = "speedtest"
speedtest_host-path = "/home/jant/bh/dz/10.terraform/log"

nginx_image = "nginx:1.23.0"
nginx_container_name = "web-nginx"
nginx_ports_external = 8080

postgres_image = "postgres:14.4"
postgres_container_name = "pg-db"
postgres_volumes_host-path = "/home/jant/bh/dz/10.terraform/pg-dump"

pgadmin4_image = "dpage/pgadmin4:6.10"
pgadmin4_container_name = "pgadmin"
pgadmin4_ports_external = 8081