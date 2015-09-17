FROM ruby:2.2.3
RUN gem install bundler
RUN gem install foreman
COPY . /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY timer.rb /app/timer.rb
COPY config.ru /app/config.ru
COPY Procfile /app/Procfile
COPY start.sh /app/start.sh
EXPOSE 4567
RUN bundler
CMD ["foreman", "start", "-d", "/app", "-f", "/app/Procfile", "-p", "4567"]
