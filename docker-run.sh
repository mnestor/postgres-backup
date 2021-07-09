#!/bin/ash

NUM_KEEP="${BACKUP_NUM_KEEP:-30}"
PG_PORT="${PGPORT:-5432}"

VARS="PGHOST PGDATABASE PGUSER PGPASSWORD"

SUCCESS=1

echo "Checking ENV"
for var in $VARS;
do
    eval VAL=\$${var}
    if [[ -z "${VAL}" ]]; then
        echo "Please set: ${var}"
        SUCCESS=0
    fi
done
if [[ "${SUCCESS}" == "0" ]]; then
    echo "One or more required environment variables was not set"
    exit 1
fi

echo ${PGHOST}:${PG_PORT}:${PGDATABASE}:${PGUSER}:${PGPASSWORD} > ~/.pgpass
chmod 0600 ~/.pgpass

echo "Running backup: ${PGDATABASE}"
pg_dump -h ${PGHOST} -Fc ${PGDATABASE} > /dump/dump_`date +%Y-%m-%d"_"%H_%M_%S`.psql

echo "Deleteing extra backups and only keeping: ${NUM_KEEP}"
ls -t /dump/dump*.psql | sort | sed -e "1,${NUM_KEEP}d" | xargs -d '\n' rm -- {}
exit 0