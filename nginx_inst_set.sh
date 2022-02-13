#!/bin/bash

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

# Apply iptables rules
iptables-restore < /root/nginx/iptables.rules

# Install repo EPEL
yum -y install epel-release

# Install Nginx
yum -y install nginx

# Backup nginx.conf
mv /etc/nginx/nginx.conf{,.old}

# Copy nginx.conf, upstreams.conf from GitHub
cp -f /root/nginx/nginx.conf /etc/nginx/
cp -f /root/nginx/conf.d/upstreams.conf /etc/nginx/conf.d/

# Start Nginx
systemctl start nginx

# Autorun Nginx
systemctl enable nginx

# Nginx status
systemctl status nginx

