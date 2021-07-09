FROM postgres:13.3-alpine

COPY docker-run.sh /

CMD "/docker-run.sh"