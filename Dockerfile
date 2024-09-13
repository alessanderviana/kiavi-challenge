FROM ruby:slim-bullseye

# Operating system dependencies
RUN apt update && \
  apt install -y nodejs npm curl postgresql-client libpq-dev zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

RUN npm install -g yarn

RUN gem install rails -v 7.2.1 && \
    rails new spina -d postgresql

# Set the base directory that will be used from now on
WORKDIR /spina

# Application dependencies
# COPY Gemfile ./
# RUN bundle install

# Create the database
# RUN rake db:create
# rails spina:install

CMD rails server