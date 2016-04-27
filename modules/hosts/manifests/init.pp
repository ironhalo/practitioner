class hosts {

#  resources { 'host':
#    purge => 'true',
#  }
#
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

  @@host { 'paul.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['paul'],
    ip           => '172.16.68.130',
    target       => '/etc/hosts',
    tag          => 'classroom',
  }

  host { 'student.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip           => '127.0.0.1',
    target       => '/etc/hosts',
    tag          => 'classroom',
  }

  Host <<| tag == 'classroom' |>>

}
