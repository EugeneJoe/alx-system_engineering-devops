#use sed to update config files to allow nginx handle opening many files

exec { 'fix--for-nginx':
  path    => ['usr/local/sbin:usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
  command => "sed -i '/error_log.*/a \\\topen_file_cache max=200000 inactive=20s;' /etc/nginx/nginx.conf &&\
             sed -i '/error_log.*/a \\\topen_file_cache_valid 30s;' /etc/nginx/nginx.conf &&\
             sed -i '/error_log.*/a \\\topen_file_cache_min_uses 2;' /etc/nginx/nginx.conf &&\
             sed -i '/error_log.*/a \\\topen_file_cache_errors on;' /etc/nginx/nginx.conf",
}

exec { 'worker_processes':
  path    => ['usr/local/sbin:usr/local/bin:/usr/sbin://usr/bin:/sbin:/bin'],
  command => "sed -i 's/worker_processes.*/worker_processes auto;/g' /etc/nginx/nginx.conf &&\
  	     sed -i 's/worker_connections.*/worker_connections 4000;/g' /etc/nginx/nginx.conf &&\
	     sed -i 's/keepalive_timeout.*/keepalive_timeout 15;/g' /etc/nginx/nginx.conf &&\
	     sed -i 's/access_log.*/access_log off;/g' /etc/nginx/nginx.conf",
}
