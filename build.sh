#!/bin/sh

POCKETBASE_VERSION=0.7.2

podman build --platform linux/amd64,linux/arm64 --manifest pocketbase:v${POCKETBASE_VERSION} --build-arg POCKETBASE_VERSION=${POCKETBASE_VERSION} .
