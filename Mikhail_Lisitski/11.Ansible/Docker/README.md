### 11.Ansible / Docker

1. Стуктура файлов
*vagrant@ansible-master:~$*

*~/ansible/*
drwxrwxr-x   Docker_ansible
-rw-rw-r--   hosts
-rw-rw-r--   playbook.yml

*~/ansible/Docker_ansible/*
  -rw-rw-r--   .dockerignore
  -rw-rw-r--   Dockerfile
  -rwxrwxr-x   docker.sh*
  -rwxrwxr-x   entrypoint.sh*

2. Запуск 
*vagrant@ansible-master:~/ansible$*  
ansible-playbook -i hosts playbook.yml
