#!/bin/bash

sudo apt-get update

euca-add-group webserver -d "Web Server Access"

euca-authorize webserver -P tcp -p 80 -s 0.0.0.0/0

euca-authorize webserver -P tcp -p 443 -s 0.0.0.0/0

euca-run-instances ami-00000002 -k openstack -t m1.tiny -g default -g webserver

euca-add-keypair myKey > myKey.pem

chmod 0600 myKey.pem

euca-run-instances ami-00000002 -k myKey -t m1.tiny

ssh ubuntu@172.16.1.1 -i myKey.pem

euca-describe-keypairs

sudo apt-get -y install cloud-utils

wget http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-i386.tar.gz

cloud-publish-tarball precise-server-cloudimg-i386.tar.gz images i386

euca-describe-images

exit
