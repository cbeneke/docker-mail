FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        exim4-daemon-heavy \
        swaks \
        heirloom-mailx \
        ca-certificates \
    && rm -rf /etc/exim4 /var/lib/apt/lists/*

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 25 465 587
