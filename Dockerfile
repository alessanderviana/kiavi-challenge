FROM ruby:3.2-bullseye

# Operating system dependencies
RUN apt update && \
apt install -y sqlite3 && \
gem install rails
# apt update && \
# apt install -y postgresql-client

RUN rails new spina
# Set the base directory that will be used from now on
WORKDIR /spina

# Application dependencies
COPY Gemfile ./
# RUN bundle install

# Source code
# COPY . .

RUN rails spina:install

CMD bin\rails server