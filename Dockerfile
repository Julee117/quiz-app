FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /quiz_app
WORKDIR /quiz_app
COPY Gemfile /quiz_app/Gemfile
COPY Gemfile.lock /quiz_app/Gemfile.lock
RUN bundle install
Copy . /quiz_app
