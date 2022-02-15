#!/bin/bash

# Run as root?
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
else

# Firewalld stop
systemctl disable firewalld
systemctl stop firewalld

# Add setting of second network device
cp -f /root/nginx/ifcfg-enp0s8 /etc/sysconfig/network-scripts/
systemctl restart network
ip -br a

# Allow forward
sysctl -w net.ipv4.ip_forward=1
sysctl -p

# Add ipv4_forward.conf into /etc/sysctl.d/ for 
# start forward after next restart host
cp -f /root/balancer/ipv4_forward.conf /etc/sysctl.d/

# Apply iptables rules
iptables-restore < /root/balancer/iptables.rules

# Install repo EPEL
yum -y install epel-release

# Install Nginx
yum -y install nginx

# Backup nginx.conf
mv /etc/nginx/nginx.conf{,.old}

# Copy nginx.conf, upstreams.conf from GitHub
cp -f /root/balancer/nginx.conf /etc/nginx/
cp -rf /root/balancer/conf.d /etc/nginx/
cp -f /root/balancer/conf_upd.sh /etc/cron.daily/

# Start Nginx
systemctl start nginx

# Autorun Nginx
systemctl enable nginx

# Nginx status
systemctl status nginx

fi
