# Configuration Management using Puppet

Configuration Management is the process of systematically handling changes to a
system in a way that it maintains integrity over time.
In the IT industry this term broadly refers to setting up and maintaining a server
or a cluster of servers.

There are various tools used for configuration management, the most popular being:

1. Puppet
2. Ansible
3. Chef
4. Salt

The files in this directory demonstrate the basic syntax and use of Puppet configuration tool. Puppet uses a 'Declarative Language; in which you describe how you would like the system to look like, not the steps to get there.

## 0-create_a_file.pp

Create a file in /tmp directory and set the following characteristics on it:
- path /tmp/holberton
- permission is 0744
- owner is www-data
- group is www-data
- contains 'I love Puppet'

## 1-install_a_package.pp

Install puppet-lint on a server:
- version must be 2.1.1

## 2-execute_a_command.pp

execute a command to kill a process named 'killmenow' using the 'pkill' command.
