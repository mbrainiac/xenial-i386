FROM ioft/i386-ubuntu:xenial

RUN apt-get update && \
      apt-get -y install sudo software-properties-common

RUN apt-add-repository -y "ppa:ubuntu-toolchain-r/test"
RUN apt-get -yq update
RUN apt-get -yq --no-install-suggests --no-install-recommends --force-yes install libgnome-keyring-dev curl git build-essential gcc make libfontconfig-dev

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker
CMD /bin/bash