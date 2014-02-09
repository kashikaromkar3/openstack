#!/bin/bash


#loopback is edited
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

#creating nova i.e, compute node
MYSQL_PASS=project

mysql -uroot -p$MYSQL_PASS -e 'CREATE DATABASE nova;'

mysql -uroot -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO
'nova'@'%'"

mysql -uroot -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO
'nova'@'localhost'"

mysql -uroot -p$MYSQL_PASS -e "SET PASSWORD FOR 'nova'@'%' =
PASSWORD('$MYSQL_PASS');"

mysql -uroot -p$MYSQL_PASS -e "SET PASSWORD FOR 'nova'@'localhost' =
PASSWORD('$MYSQL_PASS');"

sudo sed -i 's/kvm/qemu/g' /etc/nova/nova-compute.conf

sudo nova-manage db sync

sudo nova-manage network create vmnet --fixed_range_v4=10.0.0.0/8 --network_size=64 --bridge_interface=eth2

sudo nova-manage floating create --ip_range=172.16.1.0/24

./openstack/novarestart.sh

exit
