FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
ENV SUBST_FILES=
ENV DEBUG=no

# Install envsubst
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gettext-base \
        && \
    rm -rf /var/lib/apt/lists/*

COPY  run-envsubst.sh /

VOLUME [ "/etc/georchestra", "/tmp" ]

CMD ["bash","run-envsubst.sh"]
