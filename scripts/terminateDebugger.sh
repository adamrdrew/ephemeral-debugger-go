podman stop $(podman ps -q --filter ancestor=quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG )
