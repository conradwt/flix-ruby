# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 3, 3.0, 2, 2.7, 2.6
ARG VARIANT="3.3.4-slim-bullseye"
FROM mcr.microsoft.com/devcontainers/ruby:${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  postgresql-client postgresql-contrib libpq-dev \
  ffmpeg mupdf mupdf-tools libvips poppler-utils

ARG IMAGEMAGICK_VERSION="7.1.0-5"
RUN wget -qO /tmp/im.tar.xz https://imagemagick.org/archive/releases/ImageMagick-$IMAGEMAGICK_VERSION.tar.xz \
  && wget -qO /tmp/im.sig https://imagemagick.org/archive/releases/ImageMagick-$IMAGEMAGICK_VERSION.tar.xz.asc \
  && gpg --batch --keyserver keyserver.ubuntu.com --recv 89AB63D48277377A \
  && gpg --batch --verify /tmp/im.sig /tmp/im.tar.xz \
  && tar xJf /tmp/im.tar.xz -C /tmp \
  && cd /tmp/ImageMagick-$IMAGEMAGICK_VERSION \
  && ./configure --with-rsvg && make -j 9 && make install \
  && ldconfig /usr/local/lib \
  && rm -rf /tmp/*
