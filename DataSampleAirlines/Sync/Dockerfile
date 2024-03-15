FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

COPY ./Scheme /tmp/Scheme
COPY ./Scripts /tmp/Scripts

ENV PATH=$PATH:/root/.local/bin

RUN apt update \
 && apt install -y curl \
 && apt install postgresql -y
 
# установка Synth.
RUN ["/bin/bash", "-c", "bash < <(curl --proto '=https' --tlsv1.2 -sSL https://getsynth.com/install)"]

ENTRYPOINT ["/bin/sh", "-c", "cd /tmp/Scheme && synth generate $DB_NAME --to  csv:$DB_NAME.csv && /tmp/Scripts/prepareJsonInCsv.sh /tmp/Scheme/$DB_NAME.csv && /tmp/Scripts/importCsvToPostgres.sh"]