#!/bin/sh
set -euxo pipefail

echo "::group::Setup K8S cluster"
kubectl config set-cluster ${INPUT_CLUSTER} --server=${INPUT_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${INPUT_USER} --token=${INPUT_TOKEN}
kubectl config set-context ${INPUT_CONTEXT} --cluster=${INPUT_CLUSTER} --user=${INPUT_USER}
kubectl config use-context ${INPUT_CONTEXT}
echo "::endgroup::"

echo "::group::Deploy K8S cluster"
ls -al
cd ${INPUT_TEMPLATE_PATH}
kubectl apply -k .
echo "::endgroup::"
