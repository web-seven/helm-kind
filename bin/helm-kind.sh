#!/bin/sh
DIRECTORY=$(dirname $0)

kind create cluster --config $DIRECTORY/kind.yaml &&
kubectl config use-context kind-kind &&
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml &&
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s &&
if [ -e gcp.json ]
then
    kubectl create secret docker-registry gcr-json-key --docker-server=eu.gcr.io --docker-username=_json_key --docker-password="$(cat ./gcp.json)" --docker-email=any@valid.email;
fi

