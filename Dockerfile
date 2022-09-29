FROM curlimages/curl:7.78.0 AS downloader

ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG KUBECTL_VERSION=1.20.5
ARG KUSTOMIZE_VERSION=4.0.5

USER root
WORKDIR /downloads

RUN curl -fL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl -o kubectl && \
    chmod +x kubectl

RUN curl -fL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_${TARGETOS}_${TARGETARCH}.tar.gz | tar xvz && \
    chmod +x kustomize

FROM alpine:3.13.5 AS runtime

RUN apk --no-cache add gettext

COPY --from=downloader /downloads/kubectl /usr/bin/kubectl
COPY --from=downloader /downloads/kustomize /usr/bin/kustomize
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
