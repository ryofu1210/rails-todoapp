FROM ruby:2.6.5-alpine3.11

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
RUN apk update \
  && apk add --no-cache tzdata libxml2-dev curl-dev make gcc libc-dev g++ \
      mariadb-client mariadb-dev git curl file openssh openssl less bash nodejs

RUN mkdir /app

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler -v 1.17.2 && bundle install -j4

EXPOSE 3000
VOLUME /app
