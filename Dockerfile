FROM ruby:3.2.1-slim-buster

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["./exchange_rates.rb"]