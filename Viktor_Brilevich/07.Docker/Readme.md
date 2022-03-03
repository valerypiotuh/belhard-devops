1. Ссыдка на Github: https://hub.docker.com/layers/195348006/vbrilik/docker_test/speedtest/images/sha256-c54703699423dbc924aaff08d65f90742a8bc0733bfdb7c7d27283598514700f?context=repo .
2. Файл Dockerfile: скачиваем alpine:latest, создаем директорию /app, делаем ее рабочей, копируем скрипт, запускаем скрипт.
3. Файл entrypoint.sh: создаем файл, делаем исполняемым, в файле апдейтим кэш, устанавливаем curl wget git bash speedtest-cli, запускаем speedtest-cli тест с выводом результата в speedtest.log файл.
4. Результат speedtest.log теста.
5. Файл с набором команд.
