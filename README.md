# Container for PocketBase

This repository provides a Containerfile for containerizing [PocketBase].

There are some useful bash scripts included for building and running the container, or you can use the following:

[PocketBase]: https://github.com/pocketbase/pocketbase

## Building the container
```bash
podman build --platform linux/amd64,linux/arm64 --manifest pocketbase:v${POCKETBASE_VERSION} --build-arg POCKETBASE_VERSION=${POCKETBASE_VERSION} .
```

## Running the container
```bash
podman run --rm --name pocketbase -p 8090:8090 -v ./test_data:/data pocketbase:v${POCKETBASE_VERSION}
```
