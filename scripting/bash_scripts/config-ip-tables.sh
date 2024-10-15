#!/bin/bash
 
# configure iptables
 
echo "Configuring iptables..."
 
# These two rules allow all traffic coming from and going to the loopback interface (locally).
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
 
# Allows incoming traffic* that is part of an already established connection or related to an existing connection.
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
 
# This rule *allows outgoing traffic* for established connections. This ensures that once a connection is made, its outgoing traffic is permitted.
sudo iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT
 
# This rule drops any incoming packets that are considered invalid/unsafe.
sudo iptables -A INPUT -m state --state INVALID -j DROP
 
# The first rule allows new and established incoming connections via SSH.
# The second rule allows outgoing traffic for established SSH connections.
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
 
# uncomment the following lines if want allow SSH into NVA only through the public subnet (app VM as a jumpbox)
# this must be done once the NVA's public IP address is removed
#sudo iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
 
# uncomment the following lines if want allow SSH to other servers using the NVA as a jumpbox
# if need to make outgoing SSH connections with other servers from NVA
#sudo iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
 
# Allows forwarding of TCP traffic from the source network 10.0.2.0/24 to the destination network 10.0.4.0/24 on port 27017.
sudo iptables -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.4.0/24 --destination-port 27017 -m tcp -j ACCEPT
 
# This rule allows ICMP traffic to be forwarded between the two networks 10.0.2.0/24 and 10.0.4.0/24 for new and established connections.
sudo iptables -A FORWARD -p icmp -s 10.0.2.0/24 -d 10.0.4.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT
 
# This sets the default policy for incoming traffic to be dropped (blocked).
sudo iptables -P INPUT DROP
 
# This sets the default policy for forwarded traffic to be blocked, unless explicitly allowed.
sudo iptables -P FORWARD DROP
 
echo "Done!"
echo ""
 
# make iptables rules persistent
# it will ask for user input by default
 
echo "Make iptables rules persistent..."
sudo DEBIAN_FRONTEND=noninteractive apt install iptables-persistent -y
echo "Done!"
echo ""