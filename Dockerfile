FROM ubuntu:15.04

ENV PANORAMIX_VERSION 0.5.1

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y curl git python python-setuptools vim wget \
    && apt-get install -y build-essential \
    && apt-get install -y python-dev \
    && python --version \
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
