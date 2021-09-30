FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20210119 \
        exim4-daemon-heavy=4.94.2-7 \
        swaks=20201014.0-1 \
        s-nail=14.9.22-1 \
    && rm -rf /etc/exim4 /var/lib/apt/lists/*

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 25 465 587
