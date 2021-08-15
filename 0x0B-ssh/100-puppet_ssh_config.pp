#!/usr/bin/env bash
# set up ssh configuration to connect to a server without typing a password
file_line { 'password auth':
       path   => '/etc/ssh/ssh_config',
       match  => '^   PasswordAuthentication ',
       line   => '   PasswordAuthentication no',
}

file_line { 'set identity file':
       path  => '/etc/ssh/ssh_config',
       match => '^   IdentityFile ',
       line  => '   IdentityFile ~/.ssh/holberton',
}
