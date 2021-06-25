FROM node:14-buster-slim

ADD scripts /scripts
RUN chmod +x /scripts/environment.sh \
  && apt update \
  && apt upgrade -y \
  && apt install -y curl jq \
  && curl -sL https://sentry.io/get-cli/ | bash \
  && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

CMD [ "/bin/bash" ]