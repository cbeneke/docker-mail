FROM debian:stable-slim

RUN apt-get update && \
  apt-get install -y \
    ca-certificates \
    dovecot-core \
    dovecot-imapd \
    dovecot-ldap \
    dovecot-lmtpd \
    dovecot-managesieved \
    swaks \
    heirloom-mailx \
  && \
  rm -rf /etc/dovecot /var/cache/apt

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 143 993 4190
ENTRYPOINT ["/entrypoint.sh"]
