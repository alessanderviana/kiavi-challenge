FROM ruby:3.2-alpine

# Operating system dependencies
RUN adduser -D spina && \
  apt update && \
  apt install -y postgresql-client

# Set the user for RUN, CMD or ENTRYPOINT calls from now on
# Note that this doesn't apply to COPY or ADD, which use a --chown argument instead
USER spina
  
# Set the base directory that will be used from now on
WORKDIR /app

# Application dependencies
COPY --chown=spina Gemfile Gemfile.lock ./
RUN bundle install

# Source code
COPY --chown=spina my-source-code /srv/
