#!/bin/bash

# Update from GitHub
cd /root/balancer/
git pull origin main

# Update nginx.conf, default.conf in /etc/nginx
cp -f /root/balancer/nginx.conf /etc/nginx/
cp -rf /root/balancer/conf.d /etc/nginx/
iptables-restore < /root/balancer/iptables.rules

# Reload nginx configs
systemctl reload nginx
