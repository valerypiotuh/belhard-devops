### 11.Ansible / Docker

1. Стуктура файлов
*vagrant@ansible-master:~$*

*~/ansible/*
drwxrwxr-x 3 vagrant vagrant 4096 Mar 24 10:27 .
drwxr-xr-x 9 vagrant vagrant 4096 Mar 24 10:49 ..
drwxrwxr-x 2 vagrant vagrant 4096 Mar 24 10:19 Docker_ansible
-rw-rw-r-- 1 vagrant vagrant  160 Mar 21 22:26 hosts
-rw-rw-r-- 1 vagrant vagrant 2819 Mar 24 10:27 playbook.yml

*~/ansible/Docker_ansible/*
drwxrwxr-x 2 vagrant vagrant 4096 Mar 24 10:19 ./
drwxrwxr-x 3 vagrant vagrant 4096 Mar 24 10:27 ../
-rw-rw-r-- 1 vagrant vagrant   10 Mar 24 09:59 .dockerignore
-rw-rw-r-- 1 vagrant vagrant   69 Mar 24 09:59 Dockerfile
-rwxrwxr-x 1 vagrant vagrant  117 Mar 24 10:19 docker.sh*
-rwxrwxr-x 1 vagrant vagrant  137 Mar 24 09:59 entrypoint.sh*

2. Запуск 
*vagrant@ansible-master:~/ansible$*  
ansible-playbook -i hosts playbook.yml
