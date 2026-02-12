# Wrapper image for fake-gcs-server that adds env-based config support.
FROM fsouza/fake-gcs-server:1.53.1

RUN apk add --no-cache bash

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD []
