# Install an Nginx server and add a custom header to its response headers

package { 'nginx':
	ensure => 'present',
}

file_line { 'add_header':
	  ensure  => 'present',
	  path    => '/etc/nginx/nginx.conf',
	  after	  => "error_log /var/log/nginx/error.log;",
	  line	  => "\tadd_header X-Served-By \"${hostname}\";",
	  require => Package['nginx'],
	  notify  => Service['nginx'],
}

service { 'nginx':
	ensure	=> 'running',
	require	=> 'file_line['add_header'],
}
