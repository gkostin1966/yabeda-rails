FROM ruby:3.2.3

ARG USERNAME=devenv
ARG UID=1000
ARG GID=1000

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends \
      git \
      wget \
      vim

RUN groupadd -g $GID -o $USERNAME && \
    useradd -m -d /$USERNAME -u $UID -g $GID -o -s /bin/bash $USERNAME

COPY --chown=$UID:$GID . /$USERNAME

USER $USERNAME

WORKDIR /$USERNAME

CMD ["sleep", "infinity"]
