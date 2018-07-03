FROM ruby:2.3.0
RUN apt-get update && apt-get install -y openconnect iptables expect rsync bundler gnupg gnupg2
RUN gem install bundler --no-ri --no-rdoc

COPY docker-entrypoint.sh /
ENTRYPOINT ["./docker-entrypoint.sh"]
