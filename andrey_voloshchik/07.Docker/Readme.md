Ссылка на Github: https://hub.docker.com/layers/wallandrey1990/docker_you/speedtest/images/sha256-59f9983e588c8edfe7468c4ebb93ee97d5ea0c362f721427fdd32250e78a569b?context=explore
Файл Dockerfile - на базе image alpine в рабочем каталоге /app запускается скрипт entrypoint.sh (который устанавливает curl,wget,git,bash и проводит тест с выводом результата в speedtest.log файл.
