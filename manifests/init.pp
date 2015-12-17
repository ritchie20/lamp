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
	
	#EXPECT ===============
	#=======================
	
	#installing EXPECT package, required to automate MariaDB mysql_secure_installation script
	package { 'expect':
		require => Exec['yum-makecache'],
		ensure => 'present',
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
	
	#Creating file to run mysql_secure_installation script
	file { '/tmp/mysql_secure_installation.sh':
		require => Package['mariadb-server'],
		ensure => 'file',
		owner => 'root',
		mode => '0700',
		source => 'puppet:///modules/lamp/mysql_secure_installation.sh',
	}
	
	#Running script mysql_secure_installation script.sh
	exec { 'mysql_secure_installation':
		require => File['/tmp/mysql_secure_installation.sh'],
		command => '/tmp/mysql_secure_installation.sh',
		user => 'root',
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
	
	#creating directory for PHP-INFO file
	file { '/var/www/html':
		require => Package['php56w-mysql.x86_64'],
		ensure => 'directory',
	}
	
	#creating PHP-INFO file on APACHE public directory
	file {'/var/www/html/info.php':
		require => File['/var/www/html'],
		ensure => 'present',
		content => '<?php phpinfo(); ?>',
		notify => Service['httpd'],
	}
	
	#PHPMYADMIN=======================
	#=================================
	
	#installing repository EPE
	package {'epel-release':
		require => Exec['yum-makecache'],
		ensure => 'present',
	}
	
	#installing package phpmyadmin
	package { 'phpmyadmin':
		require => Package['epel-release'],
		ensure => 'present'
	}
	
	#replacing phpMyAdmin configuration file with our own file
	file { '/etc/httpd/conf.d/phpMyAdmin.conf':
		require => Package['phpmyadmin'],
		ensure => 'file',
		owner => 'root',
		mode => '0744',
		source => 'puppet:///modules/lamp/phpMyAdmin.conf',
		notify => Service['httpd'],
	}

}


