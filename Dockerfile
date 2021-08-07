FROM postgres@sha256:4a00831bfbd9929fd34975b593066f5b4af2698ed28393582f9d869aa1597bcd

COPY docker-run.sh /

CMD "/docker-run.sh"
