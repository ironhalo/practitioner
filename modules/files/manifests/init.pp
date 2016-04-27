class files {

  file { '/etc/cron.allow':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file_line { 'cron allow':
    path => '/etc/cron.allow',
    line => 'root',
  }

  file_line { 'cron deny':
    path => '/etc/cron.deny',
    line => '*',
  }

  $motd = '/etc/motd'

  concat { $motd:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'motd_header':
    target  => $motd,
    order   => '01',
    content => template('files/motd.erb'),
  }

  concat::fragment { 'motd_message':
    target  => $motd,
    content => "Your IP is ${::ipaddress}\n",
    order   => '02',
  }

}
