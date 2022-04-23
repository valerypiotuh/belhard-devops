    Поднял 3 виртуальные машины
    Установил на одну из них Ansible и изменил hostname на ansible-master
    На остальных двух виртуальных машинах изменил hostname на ansible-1 и ansible-2
    сгенерировал на ansible-master новую пару SSH ключей
    Закинул public ключ на ansible-1 и ansible-2 и проверил, что можно подключиться по SSH с ansible-master на ansible-1 и ansible-2
    create file: hosts указал айпишники....ansible-1 , ansible-2
    создал файл p_docker.yml с перемеными
    Написал playbook.yml, в котором:
      
        создается группа devops и пользователь belhard на ansible-1 и ansible-2
        устанавливаются пакеты curl, wget, unzip, zip на ansible-1 и ansible-2
        устанавливается Java 11 на ansible-1
        устанавливается nginx на ansible-2
        контейнеры без sudo

ansible-playbook -i hosts playbook.yml -v


создал файл speedtest.yml в нем
    создаем  на хосте папку docker  
    копируем файлы из седьмого домашнего задания по докеру в  папку docker
    собираем из них образ на ansible-1
    и запускаем на машине ansible-1 ждем выполнения и получам файл speedtest.log в папке docker
    
ansible-playbook -i hosts speedtest.yml -vv

-vv использовал для отладки
