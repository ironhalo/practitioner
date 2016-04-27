class hosts {

  resources { 'host':
    purge => 'true',
  }

  host { 'localhost':
    ensure       => 'present',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip           => '::1',
    target       => '/etc/hosts',
  }

  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['master'],
    ip           => '10.0.10.2',
    target       => '/etc/hosts',
  }

  @@host { $::fqdn:
    ensure       => 'present',
    host_aliases => [ $::hostname ],
    ip           => $::ipaddress,
    target       => '/etc/hosts',
    tag          => 'classroom',
  }

  host { 'student.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip           => '127.0.0.1',
    target       => '/etc/hosts',
  }

  Host <<| tag == 'classroom' |>>

}
