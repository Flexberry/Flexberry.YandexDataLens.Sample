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