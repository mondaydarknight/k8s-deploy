#!/bin/sh
set -euxo pipefail

echo "::group::Access K8S cluster"
kubectl config set-cluster ${INPUT_CLUSTER} --server=${INPUT_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${INPUT_USER} --token=${INPUT_TOKEN}
kubectl config set-context ${INPUT_CONTEXT} --cluster=${INPUT_CLUSTER} --user=${INPUT_USER}
kubectl config use-context ${INPUT_CONTEXT}
echo "::endgroup::"

echo "::group::Deploy K8S cluster"
[[ ${INPUT_VALIDATE} == 'true' ]] && k8s_args='--validate=true --dry-run=client' || k8s_args=''
cd ${INPUT_TEMPLATE_PATH}
kubectl apply ${k8s_args} -k .
echo "::endgroup::"
