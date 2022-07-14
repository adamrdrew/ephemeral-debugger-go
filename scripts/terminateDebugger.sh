rm yaml/tmp.yaml
#podman stop $(podman ps -q --filter ancestor=quay.io/$QUAY_USERNAME/$QUAY_REPO:$TAG )

# oc delete pod ephemeral-debugger-pod -n $EPHEMERAL_NAMESPACE
# oc delete service ephemeral-debugger-service-n $EPHEMERAL_NAMESPACE