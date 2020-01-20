#!/bin/sh

if [ ! -f /etc/dovecot/dovecot.conf ]; then
  echo 'Warning! No configuration file found in /etc/dovecot/dovecot.conf. Exiting.'
  exit 1
fi

for file in /etc/dovecot/*.sieve ; do
  echo "Compiling sieve script ${file}."
  sievec ${file}
done

/usr/sbin/dovecot -F
