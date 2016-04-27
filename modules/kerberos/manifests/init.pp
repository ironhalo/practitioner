##
## NOTE: context is the augeas path to the context block, specifically 'libdefaults'
##

class kerberos {

  augeas { 'kerberos':
    context => '/files/etc/krb5.conf/libdefaults',
    changes =>  'set default_realm PUPPETLABS.VM',
  }

}
