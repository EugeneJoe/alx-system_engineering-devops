# Web Infrastructure Design

The design of a website ultimately includes the deployment of the website on
the internet. This entails setting up a infrastructure that will respond to user requests to access your website. This is achieved by employing the client-server architecture.
When a user attempts to connect to a website, the client computer sends a request for data to the website server through the internet. The server accepts the request, processes it and delivers the requested data to the client. This transfer of data between the client and the server over the internet is enabled by the 'HyperText Transfer Protocol', otherwise known as HTTP. To ensure security, an encrypted version of HTTP known as HTTPS is available.

On the website server side, a web server responds to http requests. If the request only requires static data i.e. a webpage, an image, a video etc, the web server is able to retrieve the required data and send it to the client.
However, a website can also provide dynamic content. This is content that needs to be computed or generated at that instance. In this case, an application server generates the required content which is then sent back to the client. The application server could also work in tandem with a database that contains data relevant to the website and/or the user of the website.

As the demand for a website grows, the website will start receiving more users.
This leads to increased load on the server that responds to these users' requests. In such cases it is possible to have two separate servers that respond to user requests. Each server would be fully independent, complete with its own web server, application server and database.
A load balancer is used to distribute the incoming user requests between the two servers. The load balancer could itself be a server as well. The load balancer, through various algorithms, determines which server should respond to a request. The load balancer also acts as the "face" of the website, such that there is only one access point for the website despite having multiple servers responding to user requests.

To address any security concerns, firewalls are used. A firewall is able to filter out requests from clients that have been deemed malicious in order to protect the servers from attack.

To ensure the servers are operating efficiently, monitors could be set up and configured to monitor each server and raise an alarm in case of malfunction. The data from these monitors could also be used by the load balancer to determine which server to respond to a request based on its performance characteristics such as:

1. Response time
2. Number of active connections
3. Server load capacity

The files in this directory contain links to images that depict the design of a website's infrastructure. Different configurations have been explored to meet various needs such as increased load or security.
