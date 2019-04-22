FROM debian:stable-slim

RUN apt-get update && \
  apt-get install -y \
    exim4-daemon-heavy \
    swaks \
    heirloom-mailx \
    ca-certificates \
  && \
  rm -rf /etc/exim4 /var/cache/apt

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 25 465 587
ENTRYPOINT ["/entrypoint.sh"]
