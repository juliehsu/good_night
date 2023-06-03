FROM ruby:2.7.3

WORKDIR /app
COPY . /app

RUN gem install bundler:1.17.3
RUN bundle install

EXPOSE 3000

CMD ["rails","server", "-b", "0.0.0.0"]
