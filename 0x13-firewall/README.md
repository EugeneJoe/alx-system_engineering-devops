# Firewall

A firewall is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules. Firewalls are categorized as either network-based or host-based.
This directory explores the use of ufw, the uncomplicated firewall, a frontend for managing firewall rules in Arch Linux, Debian or Ubuntu. It aims to make firewall configuration easy or uncomplicated.

## 0-block_all_incoming_traffic_but

Contains the rules required for installing ufw and setting it up to block all incoming traffic except the following TCP ports:
	 - 22 (SSH)
	 - 443 (HTTPS SSL)
	 - 80 (HTTP)

## 100-port_forwarding

Configuration file for ufw to redirect requests to port 8080/tcp to port 80/tcp
