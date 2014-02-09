#!/bin/bash

sudo nova-manage user create demoUser

sudo nova-manage project add --project=cookbook --user=demoUser

sudo nova-manage project zipfile cookbook demoUser demoUser.zip

exit
