## 1 php dependency
#sudo apt install php php-mbstring php-gd php-xml php-bcmath php-ldap php-mysql

## 2 apt repos
##Ubuntu 18.04 LTS (Bionic):
#wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+bionic_all.deb
#sudo dpkg -i zabbix-release_3.4-1+bionic_all.deb

##Ubuntu 16.04 LTS (Xenial):

#wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+xenial_all.deb
#sudo dpkg -i zabbix-release_3.4-1+xenial_all.deb

##For Ubuntu 14.04 LTS (Trusty):

#wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+trusty_all.deb
#sudo dpkg -i zabbix-release_3.4-1+trusty_all.deb

#apt install zabbix-server-mysql zabbix-frontend-php zabbix-agent


## 3 DB setting , os root user
#mysql -uroot -p

#CREATE DATABASE zabbixdb;
#GRANT ALL on zabbix.* to zabbix@localhost IDENTIFIED BY 'password';
#FLUSH PRIVILEGES;


## 4. conf file (DB information)
#/etc/zabbix/zabbix_server.conf



##  5. sudo servce apache2 zabbix-server restart

## 6. http://localhost/zabbix 
