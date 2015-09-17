## Postgrest stack sample

This is an example of postgrest based project.

The following packages used:

* [PostgRest](https://github.com/begriffs/postgrest)
* [Sqitch](http://sqitch.org/)
* [Bower](http://bower.io/)

### Use

fidm start
curl -s "http://pgrest.consup/api/film?year=gte.2014-01-01&language=eq.Japanese" | jq '.'
curl -s "http://pgrest.consup/api/director?rating=gt.8"   | jq '.'

### Setup

Doc: http://blog.jonharrington.org/postgrest-introduction/

*Sqitch init sample*
```
sqitch init pgrest1
sqitch config core.engine pg
sqitch target add production db:pg://$PG_HOST:5432/pgrest1
sqitch config --add engine.pg.target production
sqitch add appschema -n 'Add schema for pgrest objects'
```

### Debug

```
pgrest1=# alter database pgrest1 set log_min_duration_statement = 0;
pgrest1=# alter database pgrest1 set log_statement = 'all';
```

### TODO

* Found a way to run superuser command (create extension if not exists sslinfo)
