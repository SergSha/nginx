<h3>nginx balancer</h3>

<p>Rename host:</p>
<pre>sudo hostnamectl set-hostname balancer</pre>

<p>Restart host:</p>
<pre>shutdown -r now</pre>

<p>Enter with root:</p>
<pre>sudo -i</pre>

<p>Get IP address device enp0s3:</p>
<pre>ip -br a</pre>

<p>Set IP into iptables.rules in GitHub:</p>
<pre>-A POSTROUTING -o enp0s3 -j SNAT --to-source 192.168.0.99</pre>

<p>Install git:</p>
<pre>yum -y install git</pre>

<p>Connect to GitHub repo for download to host:</p>
<pre>git clone https://github.com/SergSha/balancer.git</pre>

<p>================== For to upload to GitHub ==================</p>
<p>Make pair keys</p>
<pre>ssh-keygen
Enter
Enter
Enter</pre>

<p>Copy text of pub key and paste into GitHub:</p>
<pre>cat /root/.ssh/id_rsa.pub</pre>
<pre>https://github.com/settings/keys</pre>

<p>Connect to GitHub repo (balancer):</p>
<pre>git clone git@github.com:SergSha/balancer.git</pre>
<p>====================================================</p>

<p>Make the file inst_set.sh execute:</p>
<pre>chmod u+x /root/balancer/inst_set.sh</pre>

<p>Start inst_set.sh:</p>
<pre>/root/balancer/inst_set.sh</pre>
