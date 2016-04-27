# default_realm
Facter.add('role') do
  setcode "grep default_realm /etc/krb5.conf | awk '{print $3}'"
end
