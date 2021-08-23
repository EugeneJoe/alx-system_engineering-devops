# Install an Nginx server and add a custom header to its response headers

exec { 'update':
  command => 'sudo apt-get update',
  path	  => '/usr/bin:/usr/sbin:/bin',
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

file_line { 'add_header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default;',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Holberton School',
  require => file_line['addheader'],
}

service { 'nginx':
  ensure  => 'running',
  require => file_line['add_header'],
}
