# Install and configure an Nginx server with the following requirements:
# Listens on port 80
# When querying Nginx at its root /, return a page containing the string Holberton School
# Perform a permanent redirect when you query Nginx at /redirect_me

package { 'nginx':
      ensure => installed,
}

file_line { 'rewrite redirect':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    after  => 'listen 80 default_server;',
    line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file { '/var/www/html/index.html':
      content => 'Holberton School',
}

service { 'nginx':
    ensure  => 'running',
    require => Package['nginx'],
}
