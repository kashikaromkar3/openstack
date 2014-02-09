#!/bin/bash

sudo nova-manage user admin openstack

sudo nova-manage role add openstack cloudadmin

sudo nova-manage project create cookbook openstack

sudo nova-manage project zipfile cookbook openstack

exit
