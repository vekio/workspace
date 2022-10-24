FROM ubuntu:jammy

LABEL MAINTAINER "Albert Castañeiras <alberto@casta.me>"
LABEL SOURCE "https://gitea.casta.me/alberto/workspace"

RUN apt-get update && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    man-db \
    curl && \
    apt-get install -y --no-install-recommends \
    sudo

RUN groupadd -g 1000 alberto && \
    useradd -rm -d /home/alberto -s /bin/bash -g alberto -G sudo -u 1000 alberto
USER alberto

WORKDIR /home/alberto

RUN curl -o- -s https://gitea.casta.me/alberto/dotfiles/raw/branch/master/setup.sh | bash -s wsl
# RUN git clone https://gitea.casta.me/alberto/dotfiles.git ~/.dotfiles

ENTRYPOINT [ "bash" ]
