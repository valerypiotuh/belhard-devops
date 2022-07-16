# Конфигурация инфраструктуры средствами Ansible

Описываем хосты и группируем их:
##### hosts
```
[slave_group_1]
ansible-1 ansible_ssh_host=10.0.2.5 ansible_ssh_user=vagrant

[slave_group_2]
ansible-2 ansible_ssh_host=10.0.2.6 ansible_ssh_user=vagrant
```

---

Описываем playbook:
##### playbook.yml
```
- name: Add group and user for all
  gather_facts: true
  hosts: all

  tasks:
    - name: Create group
      ansible.builtin.group:
        name: devops
        state: present
        gid: 1400
      become: yes

    - name: Add user
      ansible.builtin.user:
        name: belhard
        group: devops
        shell: /bin/bash
        state: present
        uid: 1500
      become: yes

- name: Install required packages for all
  hosts: all

  tasks:
    - name: Install packages
      apt:
        update_cache: yes
        pkg:
        - curl
        - wget
        - unzip
        - zip
        autoclean: yes
        autoremove: yes
      become: yes

- name: Install Java for group 1
  hosts: slave_group_1

  tasks:
    - name: Install Java
      apt:
        update_cache: yes
        pkg:
        - openjdk-11-jdk
        autoclean: yes
        autoremove: yes
      become: yes

- name: Install Nginx for group 2
  hosts: slave_group_2

  tasks:
    - name: Install Nginx
      apt:
        update_cache: yes
        pkg:
        - nginx
        autoclean: yes
        autoremove: yes
      become: yes
      notify:
        - restart nginx

  handlers:
    - name: restart nginx
      service: name=nginx state=reloaded
      become: yes
```

---

Скрипт для запуска playbook:
##### playbook.sh
```
ansible-playbook -i hosts playbook.yml
```
