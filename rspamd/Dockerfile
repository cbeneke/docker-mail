FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20210119 \
        gnupg=2.2.27-2 \
        dirmngr=2.2.27-2 \
        wget=1.21-1+b1 \
    && rm -rf /var/lib/apt/lists/*

RUN set -x \
    && mkdir -p /etc/apt/keyrings \
    && wget -O- https://rspamd.com/apt-stable/gpg.key | gpg --dearmor > /etc/apt/keyrings/rspamd.gpg \
    && rm -rf "$GNUPGHOME" \
    && apt-key list > /dev/null

RUN echo "deb [signed-by=/etc/apt/keyrings/rspamd.gpg] http://rspamd.com/apt-stable/ bullseye main" > /etc/apt/sources.list.d/rspamd.list \
    && apt-get update \
    && apt-get install -y rspamd=3.0-2~bullseye \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'type = "console";' > /etc/rspamd/override.d/logging.inc \
    && echo 'bind_socket = "*:11333";' > /etc/rspamd/override.d/worker-normal.inc \
    && echo 'bind_socket = "*:11334";' > /etc/rspamd/override.d/worker-controller.inc \
    && echo 'pidfile = false;' > /etc/rspamd/override.d/options.inc

VOLUME [ "/var/lib/rspamd" ]

CMD [ "/usr/bin/rspamd", "-f", "-u", "_rspamd", "-g", "_rspamd" ]
EXPOSE 11333 11334
