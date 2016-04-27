class system::setenv {

  ini_setting { 'set env to paul':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'agent',
    setting => 'environment',
    value   => 'production',
  }

}
