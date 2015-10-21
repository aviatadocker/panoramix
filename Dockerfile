FROM ubuntu:15.04

ENV PANORAMIX_VERSION 0.5.1

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y build-essential curl git python python-dev python-setuptools vim wget \
    && easy_install pip \
    && pip install panoramix

RUN mkdir /panoramix
COPY admin.config /panoramix/
COPY panoramix_config.py /panoramix/

RUN fabmanager create-admin --app panoramix < /panoramix/admin.config \
    && panoramix db upgrade \
    && panoramix init

EXPOSE 8088

ENV PYTHONPATH=/panoramix:$PYTHONPATH

CMD panoramix runserver -d
