FROM ruby:2-alpine

MAINTAINER test.cab <dockerfile-from-image@test.cab>

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY dockerfile-from-image.rb .

ENTRYPOINT ["./dockerfile-from-image.rb"]
CMD ["--help"]
