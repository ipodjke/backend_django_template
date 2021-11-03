# Django template 
#### Стартовый шаблон для создания Django REST приложений

Шаблон для быстрого стара разработки REST приложений с использование docker контейнеров.

## Особенности
- для создания виртуального окружения и установки зависимостей используетс **pipenv**
- контроль версий пакет и их совместимости осуществляется с помощью **pipenv**
- разработке введется в docker контейнерах 
    - dev версия:  django + PostgreSQL
    - prod версия: nginx + (gunicorn + django) + PostgreSQL
- используемая база данных PostgreSQL, но подерживается возможность использования sqlite3
- основные конфигурационые файлы разделены на dev и prod версию
- из коробки переопределна модель Uesr, использовано наследование от AbstractUser
- нет необходимости пересобирать docker контейнер при изменении кода проекта

## Технологии
- [Django](https://www.djangoproject.com/) - Web framework
- [Django Rest FrameWork](https://www.django-rest-framework.org/) - is a powerful and flexible toolkit for building Web APIs
- [Gunicorn](https://gunicorn.org/) - Python WSGI HTTP Server для UNIX
- [Docker](https://www.docker.com/) - Package Software into Standardized Units for Development, Shipment and Deployment
- [Nginx](https://nginx.org/ru/) - HTTP-сервер и обратный прокси-сервер, почтовый прокси-сервер, а также TCP/UDP прокси-сервер общего назначения
- [PostgreSQL](https://www.postgresql.org/) - база данных

## Перечень используемых пакетов

| Основные | Dev |
| ------ | ------ |
| django | flake8 |
| djangorestframework | flake8-quotes |
| environs | flake8-broken-line |
| psycopg2-binary | flake8-return |
| django-filter | flake8-isort |
| pillow | pytest |
| gunicorn | pep8-naming |

## Cтруктура
|--apps -> содержит приложения django</br>
|--config -> содежит настройки django</br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--settings -> настройки проекта</br>
|--envfiles -> переменные виртуального окружения проекта</br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--templates -> шаблон переменных виртуального окружения</br>
|--nginx -> настройки web сервера</br>
|--utils -> содержит полезные утилиты проекта</br>

В корне проекта лежат файла для сборки контейнеров для dev и prod версии, а так же файлы с зависимостями и настройками всего проекта, в том числе стартовые скрипты создаваемых docekr контейнеров.

## Использование
- Старт dev версии:
```sh
docker-compose up -d --build
```
- Старт prod версии:
```sh
docker-compose -f docker-compose.prod.yml up -d --build
```

## License

MIT
**Free Software, Hell Yeah!**
