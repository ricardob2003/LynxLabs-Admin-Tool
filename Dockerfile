# Use the official Ruby 3.0 image as the base image
ARG RUBY_VERSION=3.0
FROM ruby:$RUBY_VERSION

# Set the working directory in the container
WORKDIR /rails

# Install system dependencies
RUN apt-get update -qq && \
  apt-get install -y install build-essential libvips && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man


#Set production environment
ENV RAILS_LOG_TO_STDOUT = "1" \
  RAILS_SERVE_STATIC_FILES = "true" \
  RAILS_ENV="production" \
  BUNDLE_WITHOUT="development"


# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Precompile bootnsap code for faster boot times
RUN bundle exec bootsnap pre-compile --gemfile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KET_BASE_DUMMY=1 bundle exec rails assets:precompile

# Entrypoint prepares the database
ENTRYPOINT ["/rails/bin/docker-entrypoint"]


# Start the server by default, this can be overwriteen at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
