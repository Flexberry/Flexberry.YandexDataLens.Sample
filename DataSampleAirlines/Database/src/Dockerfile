FROM postgres:14.8-alpine3.18

COPY ./SQL/PostgreSql.create.sql /tmp/PostgreSql.create.sql
COPY ./restore.sh /docker-entrypoint-initdb.d/restore.sh

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD Passw0rd

RUN chmod +x /docker-entrypoint-initdb.d/restore.sh