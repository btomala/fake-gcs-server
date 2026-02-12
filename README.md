# fake-gcs-server wrapper image

This repository builds a lightweight wrapper image on top of `fsouza/fake-gcs-server`.

The wrapper adds environment-variable based configuration using the `FAKE_GCS_` prefix and translates those values into the upstream CLI flags.

- Docker Hub image: https://hub.docker.com/repository/docker/bartektomala/fake-gcs-server/general
- Original project: https://github.com/fsouza/fake-gcs-server

## Base image

The wrapper image is built from:

- `fsouza/fake-gcs-server:latest`

Dependabot monitors this Docker base image so updates in the upstream image are detected automatically.

## Environment variable mapping

Mapping rule:

- Start with the original flag name.
- Replace `-` and `.` with `_`.
- Uppercase.
- Prefix with `FAKE_GCS_`.

Examples:

- `-port-http` -> `FAKE_GCS_PORT_HTTP`
- `-event.pubsub-project-id` -> `FAKE_GCS_EVENT_PUBSUB_PROJECT_ID`

The wrapper keeps the upstream default `-data /data` and appends env-derived flags.
If you pass explicit container args, they are appended last and override env values.

## Usage

```shell
docker run --rm \
  -p 4443:4443 \
  -e FAKE_GCS_SCHEME=both \
  -e FAKE_GCS_PORT=4443 \
  -e FAKE_GCS_PORT_HTTP=8000 \
  -e FAKE_GCS_EVENT_PUBSUB_PROJECT_ID=test-project \
  -e FAKE_GCS_EVENT_PUBSUB_TOPIC=gcs-events \
  bartektomala/fake-gcs-server:latest
```

