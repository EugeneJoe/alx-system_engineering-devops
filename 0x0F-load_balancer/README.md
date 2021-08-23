# Load Balancer

A load balancer distributes network traffic by distributing user requests between a cluster of available servers. It also ensures redundancy by only sending requests to available servers and performing checks to ensure a server is available. In doing so, it ensures that if a server goes down, the whose web service does not.

## 0-custom_http_response_header

Configures an Nginx server so that its HTTP response contains a custom header:

	   - name: X-Served-By
	   - value: hostname of the server Nginx is running on

## 1-install_load_balancer

Install Haproxy load balancer and configure it to balance the load between two servers.
