FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y postgresql-client

RUN mkdir /myapp
WORKDIR /myapp

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
COPY . /myapp