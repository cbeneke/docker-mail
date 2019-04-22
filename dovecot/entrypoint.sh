#!/bin/sh

if [ ! -f /etc/dovecot/dovecot.conf ]; then
  echo 'Warning! No configuration file found in /etc/dovecot/dovecot.conf. Exiting.'
  exit 1
fi

/usr/sbin/dovecot -F
