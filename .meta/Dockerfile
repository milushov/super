# https://github.com/jdrouet/docker-with-buildx/blob/master/Dockerfile
# https://gist.github.com/nzwsch/a6112fa1a0ff8a383f6ec9716fe8bdb6

# Start from the ruby base image
ARG RUBY_VERSION=3.3.5
FROM ruby:${RUBY_VERSION}

# Fetcher stage
FROM alpine AS fetcher
# Add curl to fetch buildx
RUN apk add curl
ARG BUILDX_VERSION=0.17.1
RUN curl -L \
  --output /docker-buildx \
  "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64"
# Make the downloaded buildx file executable
RUN chmod a+x /docker-buildx

# Get back to the ruby image and copy the buildx file
FROM ruby:${RUBY_VERSION}

# TODO: should we use? https://github.com/crazy-max/docker-docker
# Copy docker-buildx from the fetcher stage
COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx

# Install necessary packages
RUN apt-get update -qq && \
    apt-get install -yq docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install the kamal gem
RUN gem install kamal --without document
