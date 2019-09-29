#!/bin/sh

if [ ! -f /etc/exim4/exim4.conf ]; then
  echo 'Warning! No configuration file found in /etc/exim4/exim4.conf. Exiting.'
  exit 1
fi

if ! /usr/sbin/exim4 -bV >/dev/null ; then
  echo "Warning! Invalid configuration file. Exiting."
  exit 1
fi

/usr/sbin/exim4 -bd -q15m -v
