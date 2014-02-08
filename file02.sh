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

echo "--sql_connection=mysql://nova:project@172.16.0.1/nova">>/etc/nova/nova.conf

echo "--use_deprecated_auth">>/etc/nova/nova.conf

echo "--s3_host=172.16.0.1">>/etc/nova/nova.conf

echo "--rabbit_host=172.16.0.1">>/etc/nova/nova.conf

echo "--ec2_host=172.16.0.1">>/etc/nova/nova.conf

echo "--ec2_dmz_host=172.16.0.1">>/etc/nova/nova.conf

echo "--public_interface=eth1">>/etc/nova/nova.conf

echo "--image_service=nova.image.glance.GlanceImageService">>/etc/nova/nova.conf

echo "--glance_api_servers=172.16.0.1:9292">>/etc/nova/nova.conf

echo "--auto_assign_floating_ip=true">>/etc/nova/nova.conf

echo "--scheduler_default_filters=AllHostsFilter">>/etc/nova/nova.conf

sudo sed -i 's/kvm/qemu/g' /etc/nova/nova-compute.conf

sudo nova-manage db sync

sudo nova-manage network create vmnet --fixed_range_v4=10.0.0.0/8 --network_size=64 --bridge_interface=eth2

sudo nova-manage floating create --ip_range=172.16.1.0/24

./openstack/novarestart.sh

exit
