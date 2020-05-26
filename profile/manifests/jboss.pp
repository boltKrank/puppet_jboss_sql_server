class profile::jboss {

	# from module puppetlabs-archive:

	include 'archive'

	archive { 'C:\temp\openjdk-14.0.1_windows-x64_bin.zip':
		source => 'https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_windows-x64_bin.zip',
		extract => true,
		extract_path => 'C:\temp',
		creates => 'C:\temp\jdk-14.0.1',
		cleanup => false,
	}


#	package { 'jboss-as':
#		ensure => installed,
#		provider => chocolatey,
#		requires => Package['jdk11'],
#	}

}
