# Postgres alpine derived image for backing up a single database and triggered with [crazy-max/swarm-cronjob](https://github.com/crazy-max/swarm-cronjob)

## Backup location

Please mount your backup location to /dump

`-v /path/to/backups:/dump`

## Configurables

### Required:

```
PGHOST=
PGDATABASE=
PGUSER=
PGPASSWORD=
```

### Optional (with defaults):

```
BACKUP_NUM_KEEP=30
PGPORT=5432
```

## Example swarm config

```
  dump:
    image: mnestor/postgres-backup:latest
    depends_on:
      - db
    networks:
      - service-net
    environment:
      BACKUP_NUM_KEEP: 30
      PGHOST: tasks.service_db
      PGDATABASE: dbname
      PGUSER: dbuser
      PGPORT: 5432
      PGPASSWORD: mysecurepassword
    volumes:
      - /volume/backups/service:/dump
    deploy:
      labels:
        - "swarm.cronjob.enable=true"
        - "swarm.cronjob.schedule=44 1 * * *"
        - "swarm.cronjob.skip-running=true"
      replicas: 0
      restart_policy:
        condition: none
```
