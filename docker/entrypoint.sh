#!/bin/sh
set -euxo pipefail

kubectl config set-cluster ${PLUGIN_K8S_CLUSTER} --server=${PLUGIN_K8S_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${PLUGIN_K8S_USER} --token=${PLUGIN_K8S_TOKEN}
kubectl config set-context ${PLUGIN_K8S_CONTEXT} --cluster=${PLUGIN_K8S_CLUSTER} --user=${PLUGIN_K8S_USER}
kubectl config use-context ${PLUGIN_K8S_CONTEXT}
