#
class review (

  $user = 'review',

) {

  user { $user:
    ensure  => present,
    shell   => '/bin/csh',
    require => File['/etc/shells'],
  }

  file { '/etc/shells':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/review/shells',
  }

  file { '/etc/motd':
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('review/motd.erb'),
  }

}
