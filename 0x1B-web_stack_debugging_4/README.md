# Web Stack Debugging 4

This project involves configuring a web serer to handle many requests at a time without having failed requests.
It involves:
   - ensuring there is a worker process per cpu core.
   - ensuring each process can handle a large number of requests
   - ensuring that the server will terminate connections if the client does not respond to free up memory to deal with more requests
   - ensuring that the server does not log every request to save on I/O operations. Only errors are logged.
   - cache information about File Descriptors for frequently accessed files to boost file access performance
