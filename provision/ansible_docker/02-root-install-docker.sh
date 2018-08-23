#!/usr/bin/env bash

echo "Executing [02-root-install-docker.sh] ..."

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
rpm --import https://download.docker.com/linux/centos/gpg
yum -y install docker-ce

cat <<EOF > /etc/sysctl.d/99-docker-warning-remove.conf
# This has been added in order to avoid displaying the following warning
# from the docker client output (i.e.: docker info):
#
#   WARNING: bridge-nf-call-iptables is disabled
#   WARNING: bridge-nf-call-ip6tables is disabled
#

# please also refer to this page:
# https://github.com/moby/moby/issues/24809
#
#
# default value was 0, as following:
#   net.bridge.bridge-nf-call-ip6tables = 0
#   net.bridge.bridge-nf-call-iptables = 0

# also, according to:
#   https://access.redhat.com/solutions/2939261
#
#   "These warnings can be safely ignored as it does not have any affect
#   on how docker functions."

net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

systemctl enable docker
systemctl start docker
usermod -a -G docker vagrant
