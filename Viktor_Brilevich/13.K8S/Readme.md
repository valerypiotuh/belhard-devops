1. Создать два namespaces: mydocker1 and mydocker2
2. Первый способ запустить команду kubectl apply -f /home/vagrant/helm/docker.yml. 
3. Второй способ после helm create /home/vagrant/helm/docker и копирования файла values.yaml в эту папку
запустить команду helm install my-docker-app /home/vagrant/helm/docker -n mydocker2.
4. Для Jenkins запустить playbook файл, а потом job.
