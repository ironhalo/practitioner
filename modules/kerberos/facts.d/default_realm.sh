#! /bin/bash
echo "default_realm=`grep "default_realm" /etc/krb5.conf | awk '{print $3}'`"

