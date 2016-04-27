# default_realm
Facter.add('default_realm') do
  setcode "grep default_realm /etc/krb5.conf | awk '{print $3}'"
end
