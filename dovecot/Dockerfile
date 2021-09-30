FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20210119 \
        dovecot-core=1:2.3.13+dfsg1-2 \
        dovecot-imapd=1:2.3.13+dfsg1-2 \
        dovecot-ldap=1:2.3.13+dfsg1-2 \
        dovecot-lmtpd=1:2.3.13+dfsg1-2 \
        dovecot-managesieved=1:2.3.13+dfsg1-2 \
        swaks=20201014.0-1 \
        s-nail=14.9.22-1 \
    && rm -rf /etc/dovecot /var/lib/apt/lists/* \
    && useradd vmail --no-create-home --shell /bin/nologin --home-dir /vmail

VOLUME [ "/vmail" ]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 143 993 4190
