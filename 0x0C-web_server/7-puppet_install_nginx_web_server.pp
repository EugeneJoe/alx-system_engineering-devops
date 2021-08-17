#!/usr/bin/env bash
# Install and configure an Nginx server with the following requirements:
# Listens on port 80
# When querying Nginx at its root '/', return a page containing the string 'Holberton School'
# Perform a permanent redirect when you query Nginx at '/redirect_me'

package { 'nginx':
      ensure   => 'installed',
      name     => 'nginx',
      provider => 'apt',
}

exec { 'ufw allow':
      command => 'sudo ufw allow "Nginx HTTP"',
      path    => '/usr/bin:/usr/sbin:/bin',
}

file { '/var/www/html/index.nginx-debian.html':
      ensure  => 'present',
      path    => '/var/www/html/index.nginx-debian.html',
      mode    => '0644',
      owner   => 'root',
      content => 'Holberton School',
}

file_line { 'rewrite redirect':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    after  => 'server_name _;',
    line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service { 'nginx':
    ensure  => 'running',
    name    => 'nginx',
    require => Package['nginx'],
}
