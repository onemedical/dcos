#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

DOCKER_CREDENTIALS_PATH=/etc/docker.tar.gz
DOCKER_USERNAME="${DOCKER_USERNAME:-}"
DOCKER_PASSWORD="${DOCKER_PASSWORD:-}"

echo ">>> Starting docker"
systemctl start --no-ask-password docker

echo ">>> Logging into Docker Hub"
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

echo ">>> Archiving Docker credentials at ${DOCKER_CREDENTIALS_PATH}"
tar czf "$DOCKER_CREDENTIALS_PATH" -C "$HOME" .docker
