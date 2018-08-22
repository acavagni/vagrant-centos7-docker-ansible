#!/usr/bin/env bash

echo "[$0] ..."

rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum repolist
