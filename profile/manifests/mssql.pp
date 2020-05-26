class profile::mssql {
	
	if $facts['osfamily'] != 'Windows' {
		fail("The OS isn't supported")
	}

	#from puppetlabs-mount_iso module
	mount_iso { 'C:\temp\en_sql_server_2016_standard_with_service_pack_1_x64_dvd_9540929.iso':
		drive_letter => 'H',
	}

	user {'myuser':
		ensure => present,
	}
	
	sqlserver_instance{ 'MSSQLSERVER':
	  source                  => 'H:/',
	  #features                => ['SQL'],
	  security_mode           => 'SQL',
	  sa_pwd                  => 'p@ssw0rd!!',
	  sql_sysadmin_accounts   => ['myuser'],
	  install_switches        => {
		'TCPENABLED'          => 1,
		'SQLBACKUPDIR'        => 'C:\\MSSQLSERVER\\backupdir',
		'SQLTEMPDBDIR'        => 'C:\\MSSQLSERVER\\tempdbdir',
		'INSTALLSQLDATADIR'   => 'C:\\MSSQLSERVER\\datadir',
		'INSTANCEDIR'         => 'C:\\Program Files\\Microsoft SQL Server',
		'INSTALLSHAREDDIR'    => 'C:\\Program Files\\Microsoft SQL Server',
		'INSTALLSHAREDWOWDIR' => 'C:\\Program Files (x86)\\Microsoft SQL Server',
	  },
	}

}
