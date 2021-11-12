FROM postgres:14.1-alpine3.14

COPY docker-run.sh /

CMD "/docker-run.sh"
