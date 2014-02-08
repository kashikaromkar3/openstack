#!/bin/bash

#this updates the dependency tree so that all packages have their dependency updated
sudo apt-get update

#this installs necessary packages
sudo apt-get -y install rabbitmq-server nova-api nova-objectstore nova-scheduler nova-network nova-compute nova-cert glance qemu unzip

#after above packages are installed the network time protocol needs to #installed and configured
sudo apt-get -y install ntp

sudo sed -i 's/server ntp.ubuntu.com/server ntp.ubuntu.com\nserver 127.127.1.0\nfudge 127.127.1.0 stratum 10/g' /etc/ntp.cnf

#this restarts ntp
sudo service ntp restart

exit
