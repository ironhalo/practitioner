# default_realm
Facter.add('role') do
  setcode 'awk '/default_realm/{print $NF}' /etc/krb5.conf'
end
