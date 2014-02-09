#!/bin/bash

sudo apt-get update
sudo apt-get install euca2ools python-novaclient unzip

cd
mkdir openstack
cd openstack
scp openstack@172.16.0.1:nova.zip .
unzip nova.zip


. novarc


euca-add-keypair openstack > openstack.pem
chmod 0600 *.pem


cd ~/openstack
. novarc

wget http://uec-images.ubuntu.com/releases/precise/release/ubuntu- 12.04-server-cloudimg-i386.tar.gz

sudo apt-get update
sudo apt-get -y install cloud-utils

cloud-publish-tarball ubuntu-12.04-server-cloudimg-i386.tar.gz
images i386

euca-describe-images

euca-authorize default -P tcp -p 22 -s 0.0.0.0/0
euca-authorize default -P icmp -t -1:-1

euca-run-instances ami-00000002 -t m1.small -k openstack

euca-describe-instances

ssh -i openstack.pem ubuntu@172.16.1.1

exit


