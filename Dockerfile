# syntax = docker/dockerfile:1.3
FROM node:14-buster-slim

ADD scripts /scripts
RUN chmod +x /scripts/environment.sh \
  && apt update \
  && apt upgrade -y \
  && apt install -y curl jq wget git build-essential openssh-client \
  && curl -sL https://sentry.io/get-cli/ | bash \
  && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
  && wget https://github.com/mikefarah/yq/releases/download/v4.9.6/yq_linux_amd64 \
  && mv yq_linux_amd64 /usr/bin/yq \
  && chmod +x /usr/bin/yq

RUN npm i -g --unsafe-perm semantic-release firebase-tools firebase-ci

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

CMD [ "/bin/bash" ]