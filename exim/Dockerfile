FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        exim4-daemon-heavy=4.92-8+deb10u3 \
        swaks=20181104.0-2 \
        s-nail=14.9.11-2 \
        ca-certificates=20190110 \
    && rm -rf /etc/exim4 /var/lib/apt/lists/*

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 25 465 587
