FROM ruby:2.2.2
WORKDIR /app
ADD . /app
RUN bundle install -j4 --without test development 
