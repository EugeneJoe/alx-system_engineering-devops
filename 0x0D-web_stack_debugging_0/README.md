# Web Stack Debugging #0

Learning Objectives

- Learn the various things to check for when debugging a webstack. These include:
  - check the server uptime, connected users and load average: use "w"
  - check the recently run commands to try and figure out what might have gone wrong and where you can start your debugging work: use "history"
  - check the currently running processes and see which ones are resource intensive: use "top"
  - check disk space utilization to confirm the server is not running out of space: use df
  - check the connectivity status, i.e., what port and IP the server is listening on and what processes are using sockets: use netstat

These first 5 commands give you a good rough idea of the state of the server and may point you in the direction of where to start with the debugging process
