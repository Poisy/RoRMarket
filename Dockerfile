FROM ruby:3.1.0

WORKDIR /usr/src/app

COPY . .
RUN bundle install

COPY ./entrypoints/docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
