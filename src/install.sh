#!/usr/bin/env bash

set -o errexit

KUBECTL=1.18.2
echo "downloading kubectl ${KUBECTL}"
curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
-o /home/appuser/bin/kubectl && chmod +x /home/appuser/bin/kubectl
kubectl version --client

KUSTOMIZE=3.5.5
echo "downloading kustomize ${KUSTOMIZE}"
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE}/kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz | \
tar xz && mv kustomize /home/appuser/bin/kustomize
kustomize version

HELM_V2=2.16.7
echo "downloading helm ${HELM_V2}"
curl -sSL https://get.helm.sh/helm-v${HELM_V2}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /home/appuser/bin/helm && rm -rf linux-amd64
helm version --client

HELM_V3=3.2.1
echo "downloading helm ${HELM_V3}"
curl -sSL https://get.helm.sh/helm-v${HELM_V3}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /home/appuser/bin/helmv3 && rm -rf linux-amd64
helmv3 version

KUBEVAL=0.15.0
echo "downloading kubeval ${KUBEVAL}"
curl -sL https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL}/kubeval-linux-amd64.tar.gz | \
tar xz && mv kubeval /home/appuser/bin/kubeval
kubeval --version

KUBEAUDIT=0.11.5
echo "downloading kubeaudit ${KUBEAUDIT}"
curl -sSL https://github.com/Shopify/kubeaudit/releases/download/v${KUBEAUDIT}/kubeaudit_${KUBEAUDIT}_linux_amd64.tar.gz | \
tar xz && mv kubeaudit /home/appuser/bin/kubeaudit
kubeaudit --help

CONFTEST=0.19.0
echo "downloading conftest ${CONFTEST}"
curl -sL https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST}/conftest_${CONFTEST}_Linux_x86_64.tar.gz | \
tar xz && mv conftest /home/appuser/bin/conftest
conftest --version

KUBESEAL=0.12.5
echo "downloading kubeseal ${KUBESEAL}"
curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL}/kubeseal-linux-amd64 \
-o /home/appuser/bin/kubeseal && chmod +x /home/appuser/bin/kubeseal
kubeseal --version

YQ=4.4.1
echo "downloading yq ${YQ}"
curl -sL https://github.com/mikefarah/yq/releases/download/v${YQ}/yq_linux_amd64 \
-o /home/appuser/bin/yq && chmod +x /home/appuser/bin/yq
yq --version

JQ=1.6
echo "downloading jq ${JQ}"
curl -sL https://github.com/stedolan/jq/releases/download/jq-${JQ}/jq-linux64 \
-o /home/appuser/bin/jq && chmod +x /home/appuser/bin/jq
jq --version
