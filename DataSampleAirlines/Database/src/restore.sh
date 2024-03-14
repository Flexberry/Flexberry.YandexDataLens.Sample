#!/bin/bash
set -e

# Создаем БД:
createdb -U postgres demo

# Восстанавливаем архив:
psql -U postgres -d demo -a -f /tmp/PostgreSql.create.sql