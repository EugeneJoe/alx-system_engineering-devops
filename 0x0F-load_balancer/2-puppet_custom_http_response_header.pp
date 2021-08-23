# Install an Nginx server and add a custom header to its response headers

exec { 'update':
  command => '/usr/bin/apt-get update',
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

file_line { 'rewrite redirect':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'server_name _;',
    line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
    require => file_line['add_header'],
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Holberton School',
  require => file_line['rewrite redirerct'],
}

service { 'nginx':
  ensure  => 'running',
  require => File['/var/www/html/index.nginx-debian.html'],
}
