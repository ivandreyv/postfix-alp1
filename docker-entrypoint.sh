#!/bin/sh
set -e

# set proper rights
chown -R postfix /var/spool/postfix
chown -R :postdrop /var/spool/postfix/public
chown -R :postdrop /var/spool/postfix/maildrop
chown -R :mail /var/spool/mail
#chown -R opendkim:opendkim /etc/opendkim
#chown root:opendkim /etc/opendkim
chmod g+w /var/spool/mail

# start postfix
#/usr/sbin/postfix start

# create alias db
#/usr/sbin/postalias /etc/aliases

# start opendkim server
#/usr/sbin/opendkim -x /etc/opendkim.conf -P /var/run/opendkim/opendkim.pid

# we need some environment variables
#source /etc/sysconfig/saslauthd

#exec /usr/sbin/saslauthd -m $SOCKETDIR -a $MECH $FLAGS -d

/usr/bin/supervisord -c /etc/supervisord.conf
