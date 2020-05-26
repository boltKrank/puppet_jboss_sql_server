class profile::jboss {

	package { 'jboss-as':
		ensure => installed,
		provider => chocolatey,
	}

}
