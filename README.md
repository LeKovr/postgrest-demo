## Postgrest stack sample

This is an example of postgrest based project.

The following packages used:

* [PostgRest](https://github.com/begriffs/postgrest)
* [Sqitch](http://sqitch.org/)
* [Bower](http://bower.io/)

### Requirements

* [Docker](http://docker.io)
* [ConSup](https://github.com/LeKovr/consup)
* [FIDM](https://github.com/LeKovr/fidm)

Also, you should get [jq](http://stedolan.github.com/jq) for json replies pretty print. But this is an option.

### Install

```
for n in consul postgres nginx pgrest ; do docker pull lekovr/consup_$n ; done
echo "127.0.0.1 pgrest.consup" > /etc/hosts
fidm start
tail -f onboot.log | grep Done
```

### Use

```
curl -s "http://pgrest.consup/api/film?year=gte.2014-01-01&language=eq.Japanese" | jq '.'
curl -s "http://pgrest.consup/api/director?rating=gt.8" | jq '.'
```
or just open http://pgrest.consup in you browser

### Initial setup

If you going to create new project, read
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
