class system::dbadmins {

  $user = [
    'zack',
    'monica',
    'ralph',
    'brad',
    'luke',
  ]

  require mysql::server

  $user.each |$u| {

    $mqph = $u ? {
      'zack'  => 1200,
      default => 600,
    }

    mysql_user { "{$u}@localhost":
      ensure               => present,
      max_queries_per_hour => $mqph,
    }
  }

  #------------------#
  #  Old Code:
  #  require mysql::server
  #  mysql_user { 'zack@localhost':
  #    ensure => present,
  #    max_queries_per_hour => 1200,
  #  }
  #  mysql_user { 'monica@localhost':
  #    ensure => present,
  #    max_queries_per_hour => 600,
  #  }
  #  mysql_user { 'ralph@localhost':
  #    ensure => absent,
  #  }
  #  mysql_user { 'brad@localhost':
  #    ensure => present,
  #    max_queries_per_hour => 600,
  #  }
  #  mysql_user { 'luke@localhost':
  #    ensure => present,
  #    max_queries_per_hour => 600,
  #  }
  #------------------#

}
