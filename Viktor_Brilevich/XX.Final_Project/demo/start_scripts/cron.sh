crontab -l > mycron
echo "@reboot /home/vagrant/s.sh" >> mycron
crontab mycron 
rm mycron
