#!/bin/bash

podman login quay.io

podman build -t $QUAY_REPO:$TAG .
podman push quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG
podman run -d -p 2345:2345 quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG
