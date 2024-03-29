#!/bin/sh
DIRECTORY=$(dirname $0)

kind create cluster --config $DIRECTORY/kind.yaml &&
kubectl config use-context kind-kind &&
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml &&
if [ -e gcp.json ]
then
    kubectl create secret docker-registry gcr-json-key --docker-server=eu.gcr.io --docker-username=_json_key --docker-password="$(cat ./gcp.json)" --docker-email=any@valid.email;
fi
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.3/components.yaml

