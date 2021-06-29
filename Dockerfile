FROM node:14-buster-slim

ADD scripts /scripts
RUN chmod +x /scripts/environment.sh \
  && apt update \
  && apt upgrade -y \
  && apt install -y curl jq wget git \
  && curl -sL https://sentry.io/get-cli/ | bash \
  && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
  && helm plugin install https://github.com/chartmuseum/helm-push.git \
  && wget https://github.com/mikefarah/yq/releases/download/v4.9.6/yq_linux_amd64 \
  && mv yq_linux_amd64 /usr/bin/yq \
  && chmod +x /usr/bin/yq \
  && wget https://github.com/roboll/helmfile/releases/download/v0.139.9/helmfile_linux_amd64 \
  && mv helmfile_linux_amd64 /usr/bin/helmfile \
  && chmod +x /usr/bin/helmfile \
  && npm i -g semantic-release

CMD [ "/bin/bash" ]