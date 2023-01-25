#!/bin/sh

[[ $1 -eq 1 ]] && exit
# Needs support in 3.2.34
. /etc/sysconfig/apnscp
rm -f /var/www/html/phpMyAdmin/config.inc.php
cd "${APNSCP_ROOT:-/usr/local/apnscp}/resources/playbooks"
env BSARGS="--extra-vars='bootstrapper_acquire_lock=false yum_transaction_hook=update'" BSCHECK=0 ansible-playbook bootstrap.yml --tags=mysql/phpmyadmin
