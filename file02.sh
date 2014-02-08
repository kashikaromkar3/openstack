nova/nova.conf

sudo "--use_deprecated_auth">>/etc/nova/nova.conf

sudo "--s3_host=172.16.0.1">>/etc/nova/nova.conf

sudo "--rabbit_host=172.16.0.1">>/etc/nova/nova.conf

sudo "--ec2_host=172.16.0.1">>/etc/nova/nova.conf

sudo "--ec2_dmz_host=172.16.0.1">>/etc/nova/nova.conf

sudo "--public_interface=eth1">>/etc/nova/nova.conf

sudo "--image_service=nova.image.glance.GlanceImageService">>/etc/nova/nova.conf

sudo "--glance_api_servers=172.16.0.1:9292">>/etc/nova/nova.conf

sudo "--auto_assign_floating_ip=true">>/etc/nova/nova.conf

sudo "--scheduler_default_filters=AllHostsFilter">>/etc/nova/nova.conf

sudo sed -i 's/kvm/qemu/g' /etc/nova/nova-compute.conf

sudo nova-manage db sync

sudo nova-manage network create vmnet --fixed_range_v4=10.0.0.0/8 --network_size=64 --bridge_interface=eth2

sudo nova-manage floating create --ip_range=172.16.1.0/24

./scripts/novarestart.sh

exit
