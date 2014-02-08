#!/bin/bash

sudo stop nova-compute

sudo stop nova-network

sudo stop nova-api

sudo stop nova-scheduler

sudo stop nova-objectstore

sudo stop nova-cert

sudo stop libvirt-bin

sudo stop glance-registry

sudo stop glance-api


sudo start nova-compute

sudo start nova-network

sudo start nova-api

sudo start nova-scheduler

sudo start nova-objectstore

sudo start nova-cert

sudo start libvirt-bin

sudo start glance-registry

sudo start glance-api

exit
