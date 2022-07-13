FROM python:3.7-alpine
MAINTAINER Diego <diegosiuniube@gmail.com>

COPY requirements.txt /requirements.txt

RUN apk update && apk add python3-dev gcc libc-dev musl-dev postgresql-libs postgresql-dev libffi-dev alpine-sdk openssl-dev build-base
RUN pip install -U setuptools pip wheel && pip install -r /requirements.txt

WORKDIR /src

CMD ["pip-compile", "--upgrade", "requirements.in"]
