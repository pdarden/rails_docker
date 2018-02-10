FROM ruby:2.5.0-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client build-essential

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
