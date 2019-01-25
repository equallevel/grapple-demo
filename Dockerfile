FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libcurl4-openssl-dev libpq-dev
RUN mkdir /grapple-demo
WORKDIR /grapple-demo
COPY . /grapple-demo
RUN bin/bundle install
EXPOSE 5000
CMD ["bin/rails", "server", "-p", "5000"]