FROM postgres:13.4-alpine3.14

COPY docker-run.sh /

CMD "/docker-run.sh"
