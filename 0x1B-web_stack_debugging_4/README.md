# Web Stack Debugging 4

## 0-the_sky_is_the_limit_not.pp

This file involves configuring a web serer to handle many requests at a time without having failed requests.
It involves:
   - ensuring there is a worker process per cpu core.
   - ensuring each process can handle a large number of requests
   - ensuring that the server will terminate connections if the client does not respond to free up memory to deal with more requests
   - ensuring that the server does not log every request to save on I/O operations. Only errors are logged.
   - cache information about File Descriptors for frequently accessed files to boost file access performance

The error log files for nginx are invaluable in determining where the performance bottlenecks are.

## 1-user_limit.pp

This file involves changing the limits of number of files that a user can open on a linux server.
There are two kinds of limits:
      - soft limit: any user can change the soft limit value; check using ulimit -Sn
      - hard limit: only a privileged or root user can modify a hard limit value; check using ulimit -Hn

Changing these limits to higher values allows a user to have more files open simultaneously. Note that the soft limit cannot exceed the hard limit.
