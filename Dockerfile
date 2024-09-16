FROM ruby:slim-bullseye

ARG ENVIRONMENT=$ENVIRONMENT
ENV ENVIRONMENT=$ENVIRONMENT

# Operating system dependencies
RUN apt update && \
  apt install -y nodejs npm curl postgresql-client libpq-dev libsqlite3-dev sqlite3 \
  zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev \
  libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# Installs Rails
RUN gem install rails -v 7.2.1

# Define the working directory and adds the files
WORKDIR /app
ADD Gemfile Gemfile.lock /app/

# Installs all dependencies
RUN bundle install

# Add the entrypoint script that will be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh && \
  sed -i "s/__ENV__/$ENVIRONMENT/g" "/usr/bin/entrypoint.sh"

# The container will listen in this port
EXPOSE 3000

# Defines the entrypoint (startup) script
ENTRYPOINT ["entrypoint.sh"]

# RUN rails active_storage:install && \
#   echo "" >> /spina/Gemfile && \
#   echo "gem 'spina'" >> /spina/Gemfile && \
#   bundle install

# rails spina:install