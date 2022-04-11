cp ~/demo/hosts_set ~/demo/hosts
read -rp 'Enter ip adress of host october: ' ipaddr1
read -rp 'Enter ip adress of host backdrop: ' ipaddr2
sed -i 's/ipaddr1/'$ipaddr1'/g' ~/demo/hosts
sed -i 's/ipaddr2/'$ipaddr2'/g' ~/demo/hosts
ansible-playbook -i ~/demo/hosts ~/demo/playbooks/playbook.yml
ansible-playbook -i ~/demo/hosts ~/demo/playbooks/playbook_october.yml
ansible-playbook -i ~/demo/hosts ~/demo/playbooks/playbook_backdrop.yml
