#!/bin/bash

podman login quay.io

podman build -t $QUAY_REPO:$TAG .
podman push quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG

cat yaml/pod.yaml | sed 's/QUAY_REPO/'"$QUAY_REPO"'/' | sed 's/QUAY_USERNAME/'"$QUAY_USERNAME"'/' | sed 's/TAG/'"$TAG"'/' > yaml/tmp.yaml

oc apply -f yaml/tmp.yaml -n $EPHEMERAL_NAMESPACE
oc apply -f yaml/service.yaml -n $EPHEMERAL_NAMESPACE

#podman run -d -p 2345:2345 quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG
