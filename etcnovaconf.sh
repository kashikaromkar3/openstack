#!/bin/bash



sudo echo "--sql_connection=mysql://nova:project@172.16.0.1/nova">>/etc/nova/nova.conf

sudo echo "--use_deprecated_auth">>/etc/nova/nova.conf

sudo echo "--s3_host=172.16.0.1">>/etc/nova/nova.conf

sudo echo "--rabbit_host=172.16.0.1">>/etc/nova/nova.conf

sudo echo "--ec2_host=172.16.0.1">>/etc/nova/nova.conf

sudo echo "--ec2_dmz_host=172.16.0.1">>/etc/nova/nova.conf

sudo echo "--public_interface=eth1">>/etc/nova/nova.conf

sudo echo "--image_service=nova.image.glance.GlanceImageService">>/etc/nova/nova.conf

sudo echo "--glance_api_servers=172.16.0.1:9292">>/etc/nova/nova.conf

sudo echo "--auto_assign_floating_ip=true">>/etc/nova/nova.conf

sudo echo "--scheduler_default_filters=AllHostsFilter">>/etc/nova/nova.conf

exit
