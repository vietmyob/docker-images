FROM buildkite/agent:3.2

# kustomize, helm, kubectl, ktmpl, jq, bash, curl, sed, wget
RUN apk update && apk add make \
    &&  pip install awscli cfn-flip

ENV KUBE_VERSION="v1.10.5"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl 

ENV HELM_VERSION="v2.9.1"
RUN curl -L http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -o /tmp/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvzf /tmp/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin/ \
 && rm -f /tmp/helm-${HELM_VERSION}-linux-amd64.tar.gz

ENV KUSTOMIZE_VERSION="1.0.3"
RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64 -o /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize

ENV KTMPL_VERSION="0.8.0"
RUN curl -L https://github.com/jimmycuadra/ktmpl/releases/download/${KTMPL_VERSION}/ktmpl-${KTMPL_VERSION}-linux.tar.gz -o /tmp/ktmpl-${KTMPL_VERSION}-linux.tar.gz \
    && tar -xvzf /tmp/ktmpl-${KTMPL_VERSION}-linux.tar.gz \
    && mv ktmpl /usr/local/bin/ \
    && rm -f /tmp/ktmpl-${KTMPL_VERSION}-linux.tar.gz

