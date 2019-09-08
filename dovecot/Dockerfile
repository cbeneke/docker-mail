FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20190110 \
        dovecot-core=1:2.3.4.1-5+deb10u1 \
        dovecot-imapd=1:2.3.4.1-5+deb10u1 \
        dovecot-ldap=1:2.3.4.1-5+deb10u1 \
        dovecot-lmtpd=1:2.3.4.1-5+deb10u1 \
        dovecot-managesieved=1:2.3.4.1-5+deb10u1 \
        swaks=20181104.0-2 \
        s-nail=14.9.11-2 \
    && rm -rf /etc/dovecot /var/lib/apt/lists/* \
    && useradd vmail --no-create-home --shell /bin/nologin --home-dir /vmail

VOLUME [ "/vmail" ]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 143 993 4190
