#!/usr/bin/env bash
set -euo pipefail

args=(-data /data)

add_flag() {
  local env_name="$1"
  local flag_name="$2"
  local value="${!env_name-}"
  if [[ -n "${value}" ]]; then
    args+=("-$flag_name" "$value")
  fi
}

add_flag FAKE_GCS_BACKEND backend
add_flag FAKE_GCS_FILESYSTEM_ROOT filesystem-root
add_flag FAKE_GCS_PUBLIC_HOST public-host
add_flag FAKE_GCS_EXTERNAL_URL external-url
add_flag FAKE_GCS_SCHEME scheme
add_flag FAKE_GCS_HOST host
add_flag FAKE_GCS_DATA data
add_flag FAKE_GCS_CORS_HEADERS cors-headers
add_flag FAKE_GCS_PORT port
add_flag FAKE_GCS_PORT_HTTP port-http
add_flag FAKE_GCS_EVENT_PUBSUB_PROJECT_ID event.pubsub-project-id
add_flag FAKE_GCS_EVENT_PUBSUB_TOPIC event.pubsub-topic
add_flag FAKE_GCS_EVENT_BUCKET event.bucket
add_flag FAKE_GCS_EVENT_OBJECT_PREFIX event.object-prefix
add_flag FAKE_GCS_EVENT_LIST event.list
add_flag FAKE_GCS_LOCATION location
add_flag FAKE_GCS_CERT_LOCATION cert-location
add_flag FAKE_GCS_PRIVATE_KEY_LOCATION private-key-location
add_flag FAKE_GCS_LOG_LEVEL log-level

exec /bin/fake-gcs-server "${args[@]}" "$@"
