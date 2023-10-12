# Use the official Ruby 3.0 image as the base image
ARG RUBY_VERSION=3.0
FROM ruby:$RUBY_VERSION

# Set the working directory in the container
WORKDIR /rails

# Install system dependencies
RUN apt-get update -qq && \
  apt-get install -y build-essential libvips && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# Set production environment (remove spaces around '=')
ENV RAILS_LOG_TO_STDOUT="1" \
  RAILS_SERVE_STATIC_FILES="true" \
  RAILS_ENV="production" \
  BUNDLE_WITHOUT="development"

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times (correct the typo)
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Precompile assets for production without requiring secret RAILS_MASTER_KEY (correct the typo)
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# Entrypoint prepares the database
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
