FROM ruby:slim-bullseye

ARG ENVIRONMENT=$ENVIRONMENT
ENV RAILS_ENV=${ENVIRONMENT}

# Operating system dependencies
RUN apt update && \
  apt install -y nodejs npm curl postgresql-client libpq-dev \
  build-essential software-properties-common coreutils

# Installs Rails
RUN gem install rails -v 7.2.1

# Define the working directory and adds the files
WORKDIR /app
ADD Gemfile Gemfile.lock /app/

# Installs all dependencies
# Installs support for cloud storage
RUN bundle install && \
  rails active_storage:install

# The container will listen in this port
EXPOSE 3000

CMD ["sh", "-c", "rails db:create && /usr/bin/tail -f /dev/null"]