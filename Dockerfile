# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.3.5

FROM ruby:${RUBY_VERSION}-slim

ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_RETRY=3 \
    BUNDLE_PATH=/bundle \
    BUNDLE_APP_CONFIG=/bundle \
    BUNDLE_BIN=/bundle/bin \
    BOOTSNAP_CACHE_DIR=/bundle/_bootsnap \
    DEBIAN_FRONTEND=noninteractive \
    APP_DIR=/app \
    PATH=/app/bin:/bundle/bin:/root/.cargo/bin:$PATH

WORKDIR ${APP_DIR}
COPY Gemfile Gemfile.lock .ruby-version ${APP_DIR}

# OS Level Dependencies
RUN --mount=type=cache,target=/var/cache/apt \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  rm -f /etc/apt/apt.conf.d/docker-clean; \
  echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache; \
  apt-get update -qq && \
  apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    vim \
    curl \
    ffmpeg \
    libvips \
    wget \
    vim && \
  gem install bundler:"$(tail -n 1 Gemfile.lock)" \
  ;

# Install JavaScript dependencies
ARG NODE_VERSION=20.17.0
ARG YARN_VERSION=1.22.22

ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
