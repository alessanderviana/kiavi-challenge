FROM ruby:slim-bullseye

ARG ENVIRONMENT=$ENVIRONMENT
ENV ENVIRONMENT=$ENVIRONMENT

# Operating system dependencies
RUN apt update && \
  apt install -y nodejs npm curl postgresql-client libpq-dev libsqlite3-dev sqlite3 \
  zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev \
  libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

RUN gem install rails -v 7.2.1 
# && \
#   rails new spina -d postgresql

# Set the base directory that will be used from now on
# WORKDIR /spina

COPY config/ .

# RUN rails active_storage:install && \
#   echo "" >> /spina/Gemfile && \
#   echo "gem 'spina'" >> /spina/Gemfile && \
#   bundle install

# Create the database
# RUN rake db:create && \
#   rake db:migrate
# rails spina:install

# CMD rails server