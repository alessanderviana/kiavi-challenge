FROM ruby:slim-bullseye

ARG ENVIRONMENT=$ENVIRONMENT
ENV RAILS_ENV=${ENVIRONMENT}

# Operating system dependencies
RUN apt update && \
  apt install -y curl vim libpq-dev coreutils build-essential
# software-properties-common

# Installs Rails
RUN gem install rails -v 7.2.1 imagemagick-binaries

# Define the working directory
WORKDIR /app

# Adds the application files
ADD . .

# Installs all dependencies
# Installs support for cloud storage
RUN bundle install

# The container will listen in this port
EXPOSE 3000

# CMD ["sh", "-c", "rails db:create && rails assets:precompile && /usr/bin/tail -f /dev/null"]