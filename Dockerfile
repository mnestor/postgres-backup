FROM postgres:13.3-alpine3.14

COPY docker-run.sh /

CMD "/docker-run.sh"
