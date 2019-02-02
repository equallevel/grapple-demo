FROM ruby:2.5 AS base
RUN apt-get update -qq && apt-get install -y build-essential libcurl4-openssl-dev libpq-dev nodejs
RUN mkdir /grapple-demo
WORKDIR /grapple-demo
COPY Gemfile* /grapple-demo/

# Development server
FROM base AS development
RUN bundle install
COPY . /grapple-demo
ENTRYPOINT ["bin/start"]
CMD ["bin/rails", "server"]

# Production/staging Releases
FROM base AS release
RUN bundle config --global frozen 1 \
	&& bundle install --without development test -j4 --retry 3 \
	# Remove unneeded files (cached *.gem, *.o, *.c)
	&& rm -rf /usr/local/bundle/cache/*.gem \
	&& find /usr/local/bundle/gems/ -name "*.c" -delete \
	&& find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the Rails app
COPY . /grapple-demo

# Precompile assets
RUN RAILS_ENV=production RAILS_RELATIVE_URL_ROOT=/grapple/ bundle exec rake assets:precompile

# Remove folders not needed in resulting image
RUN rm -rf node_modules test /pint-admin/tmp

ENTRYPOINT ["bin/start"]
CMD ["bin/run"]
