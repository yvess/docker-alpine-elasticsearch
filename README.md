Alpine Elasticsearch Docker image
=================================

This image is based on Alpine Linux image. It uses the small footprint [develar/java](https://registry.hub.docker.com/u/develar/java/)
as java runtime.

[![](https://badge.imagelayers.io/yvess/alpine-elasticsearch:latest.svg)](https://imagelayers.io/?images=yvess/alpine-elasticsearch:latest 'Get your own badge on imagelayers.io')


Usage
-----

This image is ideal for usage with an extra data volume.
The default data volume path used is `/var/services`.

With the optional variable `ELASTICSEARCH_YML_APPEND` you can append custom stuff
to the `elasticsearch.yml` file. This can be anything you want.

Here is how to use it in the `docker-compose.yml` file:

```yaml
elasticsearch:
  image: yvess/alpine-elasticsearch:latest
  hostname: elasticsearch
  environment:
    ES_HEAP_SIZE: 1G
    ELASTICSEARCH_LOG: /var/services/log/
    ELASTICSEARCH_DATA: /var/services/data/elasticsearch/
    ELASTICSEARCH_YML_APPEND: |
      index:
          number_of_shards: 1
          number_of_replicas: 0
  volumes_from:
    - my_data
  ports:
    - "9200:9200"
    - "9300:9300"
```
