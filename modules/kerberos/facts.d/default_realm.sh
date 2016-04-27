#! /bin/bash
echo "default_realm_bash=`grep "default_realm" /etc/krb5.conf | awk '{print $3}'`"

