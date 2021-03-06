# syntax = docker/dockerfile:1.3
FROM node:14-buster-slim

ADD scripts /scripts
RUN chmod +x /scripts/environment.sh \
  && apt update \
  && apt install -y curl jq wget git build-essential openssh-client \
  && curl -sL https://sentry.io/get-cli/ | bash \
  && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
  && wget https://github.com/mikefarah/yq/releases/download/v4.9.6/yq_linux_amd64 \
  && mv yq_linux_amd64 /usr/bin/yq \
  && chmod +x /usr/bin/yq \
  && wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz \
  && tar xf kubeval-linux-amd64.tar.gz \
  && mv kubeval /usr/local/bin

RUN helm plugin install https://github.com/chartmuseum/helm-push

RUN npm i -g --unsafe-perm semantic-release

CMD [ "/bin/bash" ]
