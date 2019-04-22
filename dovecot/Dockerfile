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
  rm -rf /etc/dovecot /var/cache/apt && \
  useradd vmail --gid vmail --no-create-home --shell /bin/nologin --home-dir /vmail

VOLUME /vmail

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 143 993 4190
ENTRYPOINT ["/entrypoint.sh"]
