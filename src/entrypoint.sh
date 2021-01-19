#!/usr/bin/env bash

set -e
set -o pipefail

KUBECTL_VER=$2
if [[ "${KUBECTL_VER}" != "" ]]; then
  curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl \
  -o /home/appuser/bin/kubectl && chmod +x /home/appuser/bin/kubectl
fi

KUSTOMIZE_VER=$3
if [[ "${KUSTOMIZE_VER}" != "" ]]; then
  curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz | \
  tar xz && mv kustomize /home/appuser/bin/kustomize
fi

HELM_VER=$4
if [[ "${HELM_VER}" != "" ]]; then
  curl -sL https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz | \
  tar xz && mv linux-amd64/helm /home/appuser/bin/helm && rm -rf linux-amd64
fi

HELM3_VER=$5
if [[ "${HELM3_VER}" != "" ]]; then
  curl -sL https://get.helm.sh/helm-v${HELM3_VER}-linux-amd64.tar.gz | \
  tar xz && mv linux-amd64/helm /home/appuser/bin/helmv3 && rm -rf linux-amd64
fi

KUBESEAL_VER=$6
if [[ "${KUBESEAL_VER}" != "" ]]; then
  curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VER}/kubeseal-linux-amd64 \
  -o /home/appuser/bin/kubeseal && chmod +x /home/appuser/bin/kubeseal
fi

YQ_VER=$7
if [[ "${YQ_VER}" != "" ]]; then
curl -sL https://github.com/mikefarah/yq/releases/download/v${YQ_VER}/yq_linux_amd64 \
-o /home/appuser/bin/yq && chmod +x /home/appuser/bin/yq
fi

JQ_VER=$8
if [[ "${JQ_VER}" != "" ]]; then
curl -sL https://github.com/stedolan/jq/releases/download/jq-${JQ_VER}/jq-linux64 \
-o /home/appuser/bin/jq && chmod +x /home/appuser/bin/jq
fi

echo ">>> Executing command <<<"
echo ""
echo ""

bash -c "set -e;  set -o pipefail; $1"
