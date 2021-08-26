# HTTPS SSL

HTTPS is a secure version of the HTTP protocol that encrypts all data sent over the internet between servers and clients to ensure no one else has access to that data other than the intended parties.

TLS/SSL is a cryptographic protocol designed to provide secure communication over a computer network. It is the technology used in securing HTTPS connections.

The files in this directory:

## 0-world_wide_web

Displays information about the subdomains for a registered domain such as:
	 - What type of record is associated with the subdomain
	 - The IP address the subdomain points to

## 1-haproxy_ssl_termination

Configuration file of HAproxy server that accepts encrypted traffic for the subdomain www.
