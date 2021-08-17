#!/usr/bin/env bash
# Install and configure an Nginx server with the following requirements:
# Listens on port 80
# When querying Nginx at its root '/', return a page containing the string 'Holberton School'
# Perform a permanent redirect when you query Nginx at '/redirect_me'

exec { 'update':
    command => 'sudo apt-get -y update',
    path    => '/usr/bin:/usr/sbin:/bin',
}

package { 'nginx':
      ensure   => 'installed',
      name     => 'nginx',
      provider => 'apt',
      require  => Exec['update'],
}

exec { 'ufw allow':
      command => "sudo ufw allow \'Nginx HTTP\'",
      path    => '/usr/bin:/usr/sbin:/bin',
      require => Package['nginx'],
}

file { '/var/www/html/index.nginx-debian.html':
      ensure  => 'present',
      path    => '/var/www/html/index.nginx-debian.html',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'Holberton School',
}

file_line { 'rewrite redirect':
    ensure  => 'present',
    after   => 'server_name _;',
    path    => '/etc/nginx/sites-available/default',
    line    => "\tserver_name _;\n\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
    notify  => Exec['nginx restart'],
    require => File['/var/www/html/index.nginx-debian.html'],
}

exec { 'nginx restart':
    command => 'sudo service nginx restart',
    path    => '/usr/bin:/usr/sbin:/bin',
    require => Package['nginx'],
}
