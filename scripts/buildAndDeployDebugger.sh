#!/bin/bash

oc delete pod ephemeral-debugger-pod -n $EPHEMERAL_NAMESPACE

podman login quay.io

podman build -t $QUAY_REPO:$TAG .
podman push $QUAY_REPO:$TAG quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG

sleep 10

cat yaml/pod.yaml | sed 's/QUAY_REPO/'"$QUAY_REPO"'/' | sed 's/QUAY_USERNAME/'"$QUAY_USERNAME"'/' | sed 's/TAG/'"$TAG"'/' > yaml/tmp.yaml

oc apply -f yaml/tmp.yaml -n $EPHEMERAL_NAMESPACE
oc apply -f yaml/service.yaml -n $EPHEMERAL_NAMESPACE

sleep 5


#podman run -d -p 2345:2345 quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG
