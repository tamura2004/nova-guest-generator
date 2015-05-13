FROM ruby:2.2.2

ADD . /app
WORKDIR /app/nova-guest-generator
RUN bundle install -j4 --without test development 
