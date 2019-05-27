FROM ruby:2.6.3-slim-stretch

# set workdir
WORKDIR /code

# install sys pkgs
RUN apt-get update
RUN apt-get install build-essential -y

# install bundler
RUN gem install bundler

# copy gemfile
COPY Gemfile .
COPY Gemfile.lock .

# install gems
RUN bundle install --path=vendor

# copy code
COPY .bundle .bundle
COPY app app
COPY bin bin
COPY config config
COPY config.ru .

# expose port
EXPOSE 3001

# default cmd
CMD ["bundle", "exec", "rails", "s", "-p", "3001", "-b", "0.0.0.0"]
