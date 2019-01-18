FROM ruby:2.5
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libcurl4-openssl-dev libpq-dev nodejs
RUN mkdir /grapple-demo
WORKDIR /grapple-demo
COPY . /grapple-demo
RUN bin/bundle install
RUN rake load_fixtures
EXPOSE 5000
CMD ["bin/rails", "server", "-p", "5000"]