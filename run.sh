#!/bin/bash

podman run --rm --name pocketbase -p 8090:8090 -v ./test_data:/data pocketbase:v0.7.2 $@
