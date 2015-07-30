FROM develar/java:latest
MAINTAINER y@yas.ch

ENV ES_VERSION 1.7.1

# Install Elasticsearch.
RUN apk add --update curl && \
  ( curl -Lskj https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv /elasticsearch-$ES_VERSION /elasticsearch && \
  rm -rf $(find /elasticsearch | egrep "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))") && \
  apk del curl && \
  rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*
ADD elasticsearch.yml /elasticsearch/config/

ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["elasticsearch"]

EXPOSE 9200 9300
