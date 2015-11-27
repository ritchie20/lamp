class lamp {
	
	#updating YUM repos
	exec { 'yum-makecache':
	command => '/usr/bin/yum makecache',
	}
	
	#APACHE==================
	#========================
	
	#installing APACHE package, require to update YUM repos first
	package { 'httpd':
		require => Exec['yum-makecache'],
		ensure => 'present',
	}
	
	#starting APACHE service, require APACHE package first
	service { 'httpd':
		require => Package['httpd'],
		ensure => 'running',
		enable => true,
	}
	
	#MARIA-SQL ============
	#======================
	
	#installing MariaDB package, require to update YUM repos first
	package { 'mariadb':
		require => Exec['yum-makecache'],
		ensure => 'present',
	}

	#installing MariaDB-server package, require MariaDB package first
	package { 'mariadb-server':
		require => Package['mariadb'],
		ensure => 'present',
	}
	
	#starting MySQL service, require MariaDB and MariaDB-server packages
	service { 'mariadb':
		require => Package['mariadb-server'],
		ensure => 'running',
		enable => 'true',
	}
	
	#PHP ============
	#======================
	
	#instaliing PHP package, require to update YUM repos first
	package { 'php56w.x86_64':
		require => Exec['yum-makecache'],
		ensure => 'present',
	}
	
	#installing PHP-MYSQL package, require to update YUM repos first
	package { 'php56w-mysql.x86_64':
		require => Package['php56w.x86_64'],
		ensure => 'present',
	}

}
