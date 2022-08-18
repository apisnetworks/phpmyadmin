#!/bin/sh

. /etc/sysconfig/apnscp
rm -f /var/www/html/phpMyAdmin/config.inc.php
cd "${APNSCP_ROOT:-/usr/local/apnscp}/resources/playbooks"
env BSARGS="--extra-vars=bootstrapper_acquire_lock=false" BSCHECK=0 ansible-playbook bootstrap.yml --tags=mysql/phpmyadmin
