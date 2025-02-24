#!/bin/sh

if [ ! -d /opt/unbound/etc/unbound/dev ]
then
	mkdir -p /opt/unbound/etc/unbound/dev
	cp -a /dev/random /dev/urandom /opt/unbound/etc/unbound/dev/
fi

if [ ! -d /opt/unbound/etc/unbound/var ]
then
	mkdir -p -m 700 /opt/unbound/etc/unbound/var
	chown unbound:unbound /opt/unbound/etc/unbound/var
fi

# update the root trust anchor for DNSSEC validation.
# this tool exits with value 1 if the root anchor was updated using the
# certificate or if the builtin root-anchor was used.
# it exits with code 0 if no update was necessary, if the update was
# possible with RFC5011 tracking, or if an error occurred.
/opt/unbound/sbin/unbound-anchor -a /opt/unbound/etc/unbound/var/root.key || true

exec /opt/unbound/sbin/unbound -d -c /opt/unbound/etc/unbound/unbound.conf
