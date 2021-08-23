# Install an Nginx server and add a custom header to its response headers
exec { 'update':
     command => '/usr/bin/apt-get update',
}

package { 'nginx':
	ensure  => 'installed',
	require => Exec['update'],
}

file_line { 'add_header':
	  ensure  => 'present',
	  path    => '/etc/nginx/sites-available/default;',
	  after	  => "root /var/www/html;",
	  line	  => "add_header X-Served-By \$hostname};",
	  require => Package['nginx'],
}

service { 'nginx':
	ensure	=> 'running',
	require	=> 'file_line['add_header'],
}
