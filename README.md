# Flexberry.YandexDataLens.Sample

## Необходимые для запуска примера технологии
Для запуска примера потребуется:
1. [Docker](https://docs.docker.com/desktop/install/windows-install/)

## Последовательность действий для запуска

1. Собрать Docker-образы
```
\src\Docker> .\create-image.cmd
```

2. Запустить Docker-образы
```
\src\Docker> .\start.cmd
```

Теперь все запущено

http://localhost:8080/ - web приложение
http://localhost:8081/ - API контроллера для доступа к метаданным DataLens
http://localhost:8082/ - API для доступа к данным DataLens

3. Остановить Docker-образы
```
\src\Docker> .\stop.cmd
```

## Запуск БД с генерацией тестовых данных.

1. Для примера подготовлена база Postgres с информацией об авиаперелетах - DataSampleAirlines. Запускается в докере

```
\DataSampleAirlines\Database\src\create-image.cmd
```

```
\DataSampleAirlines\Database\src\start.cmd
```

2. Генерация тестовых данных. Выполняется с использованием Synth (https://www.getsynth.com/).

Генерация выполняется автоматически в специальном Docker контейнере, после чего из контейнера также автоматически выполняется соединение с БД и импорт данных.
Для генерации заготовлена схема данных.

```
\DataSampleAirlines\Sync\Scheme
```

Также необходим файл в котором задан перечень и порядок импорта по таблицам.

```
\DataSampleAirlines\Sync\Scheme\importList.txt
```

Чтобы выполнить импорт нужно собрать образ

```
\DataSampleAirlines\Sync\create-image.cmd
```

и запустить

```
\DataSampleAirlines\Sync\start.cmd
```

Генерация и импорт происходят при старте контейнера, потом его можно удалить
