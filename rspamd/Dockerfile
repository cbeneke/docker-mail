FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gnupg=2.2.12-1+deb10u1 \
        dirmngr=2.2.12-1+deb10u1 \
    && rm -rf /var/lib/apt/lists/*

RUN set -x \
# gpg: key FFA232EDBF21E25E: public key "Rspamd Nightly Builds (Rspamd Nightly Builds) <vsevolod@highsecure.ru>" imported
    && key='3FA347D5E599BE4595CA2576FFA232EDBF21E25E' \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" \
    && gpg --export "$key" > /etc/apt/trusted.gpg.d/rspamd.gpg \
    && rm -rf "$GNUPGHOME" \
    && apt-key list > /dev/null

RUN echo "deb http://rspamd.com/apt-stable/ buster main" > /etc/apt/sources.list.d/rspamd.list \
    && apt-get update \
    && apt-get install -y rspamd=2.2-1~buster \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'type = "console";' > /etc/rspamd/override.d/logging.inc \
    && echo 'bind_socket = "*:11333";' > /etc/rspamd/override.d/worker-normal.inc \
    && echo 'bind_socket = "*:11334";' > /etc/rspamd/override.d/worker-controller.inc \
    && echo 'pidfile = false;' > /etc/rspamd/override.d/options.inc

VOLUME [ "/var/lib/rspamd" ]

CMD [ "/usr/bin/rspamd", "-f", "-u", "_rspamd", "-g", "_rspamd" ]
EXPOSE 11333 11334
