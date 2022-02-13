# Get IP address device enp0s3
ip -br a

# Set IP into iptables.rules in GitHub
-A POSTROUTING -o enp0s3 -j SNAT --to-source 192.168.43.32

# Make pair keys
ssh-keygen #Enter-Enter-Enter

# Copy text of pub key and paste into GitHub:
cat /root/.ssh/id_rsa.pub
https://github.com/settings/keys

# Install git
yum -y install git

# Connect to GitHub repo (nginx)
git clone git@github.com:SergSha/nginx.git

# Make the file nginx_inst_set.sh execute
chmod u+x /root/nginx/nginx_inst_set.sh

# Start nginx_inst_set.sh
/root/nginx/nginx_inst_set.sh
