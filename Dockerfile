# FROM debian:bullseye-slim
FROM ruby:slim-bullseye

# Operating system dependencies
RUN apt update && \
  apt install -y nodejs npm curl postgresql-client libpq-dev zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# RUN cd && \
#     git clone https://github.com/excid3/asdf.git ~/.asdf && \
#     echo -e '. "\n$HOME/.asdf/asdf.sh"' >> ~/.bashrc && \
#     echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc && \
#     echo 'legacy_version_file = yes' >> ~/.asdfrc && \
#     echo 'export EDITOR="code --wait"' >> ~/.bashrc && \
#     exec $SHELL

    # RUN cd && \
#     git clone https://github.com/excid3/asdf.git ~/.asdf

# RUN echo -e '. "\n$HOME/.asdf/asdf.sh"' >> ~/.bashrc
# RUN echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
# RUN echo 'legacy_version_file = yes' >> ~/.asdfrc
# RUN echo 'export EDITOR="code --wait"' >> ~/.bashrc
# RUN exec $SHELL && echo $SHELL

# RUN ~/.asdf/bin/asdf plugin add ruby && \
#     ~/.asdf/bin/asdf plugin add nodejs && \
#     ~/.asdf/bin/asdf install ruby 3.3.4 && \
#     ~/.asdf/bin/asdf global ruby 3.3.4 && \
#     gem update --system && \
#     ~/.asdf/bin/asdf install nodejs 20.17.0 && \
#     ~/.asdf/bin/asdf global nodejs 20.17.0 && \
#     npm install -g yarn

# RUN ~/.asdf/bin/asdf plugin add ruby && \
#     ~/.asdf/bin/asdf plugin add nodejs

# RUN ~/.asdf/bin/asdf install ruby 3.3.4 && \
#     ~/.asdf/bin/asdf global ruby 3.3.4

# RUN ~/.asdf/bin/gem update --system

# RUN ~/.asdf/bin/asdf install nodejs 20.17.0 && \
#     ~/.asdf/bin/asdf global nodejs 20.17.0 && \
RUN npm install -g yarn

RUN gem install rails -v 7.2.1 && \
    rails new spina -d postgresql
# Set the base directory that will be used from now on
WORKDIR /spina

# Application dependencies
# COPY Gemfile ./
# RUN bundle install

# Source code
# COPY . .

# Create the database
# RUN rake db:create
# rails spina:install

CMD rails server