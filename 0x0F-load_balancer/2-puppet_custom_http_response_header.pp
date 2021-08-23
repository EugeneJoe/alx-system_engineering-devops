# Install an Nginx server and add a custom header to its response headers

package { 'nginx':
	ensure => installed,
}

file_line { 'add_header':
	  ensure  => 'present',
	  path    => '/etc/nginx/sites-available/default',
	  after	  => '# include snippets/snakeoil.conf;',
	  line	  => '\\\tadd_header X-Served-By $hostname;',
	  require => Package['nginx'],
	  notify  => Service['nginx'],
}

service { 'nginx':
	ensure	=> 'running',
	require	=> 'file_line['add_header'],
}
