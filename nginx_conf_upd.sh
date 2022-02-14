#!/bin/bash

# Update from GitHub
cd /root/nginx/
git pull origin main

# Update nginx.conf, default.conf in /etc/nginx
cp -f /root/nginx/nginx.conf /etc/nginx/
cp -rf /root/conf.d /etc/nginx/
iptables-restore < /root/nginx/iptables.rules

# Reload nginx configs
systemctl reload nginx
