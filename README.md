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
NUM_KEEP="${BACKUP_NUM_KEEP:-30}"
PG_PORT="${PGPORT:-5432}"
```