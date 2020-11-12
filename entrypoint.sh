#!/bin/sh
set -e

# set proper rights
chown -R postfix /var/spool/postfix
chown -R :postdrop /var/spool/postfix/public
chown -R :postdrop /var/spool/postfix/maildrop
chown -R :mail /var/spool/mail
chmod g+w /var/spool/mail

/usr/bin/supervisord -c /etc/supervisord.conf
