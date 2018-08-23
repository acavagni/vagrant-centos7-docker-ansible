#!/usr/bin/env bash

echo "Executing [01-root-install-utils.sh] ..."

yum -y install tree sshpass git psmisc vim-enhanced python-virtualenv python-beautifulsoup4 python2-pip tcpdump nmap nmon pstree jq yum-utils
