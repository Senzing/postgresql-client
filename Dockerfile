ARG BASE_IMAGE=alpine:3.11
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2020-03-26

LABEL Name="senzing/postgresql-client" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apk.

RUN apk --update add postgresql-client \
 && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
