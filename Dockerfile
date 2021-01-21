FROM docker:stable

WORKDIR /app
ADD docker-entrypoint.sh cleanup.sh ./

ENV CLEANUP_RATE 120
ENV FREE_DISK_THRESHOLD_GB 25

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]