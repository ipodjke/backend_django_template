FROM python:3.9-alpine

ENV HOME=/usr/src/app
ENV APP_HOME=$HOME/backend
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR $APP_HOME


RUN apk update && \
    apk add zlib-dev jpeg-dev postgresql-dev gcc python3-dev musl-dev && \
    apk add --update alpine-sdk && apk add libffi-dev openssl-dev cargo rust

RUN pip install --upgrade pip && \
    pip install pipenv

COPY Pipfile .
COPY Pipfile.lock .

RUN pipenv install --system --deploy --dev

COPY . .

ENTRYPOINT ["/usr/src/app/backend/docker-entrypoint.sh"]
