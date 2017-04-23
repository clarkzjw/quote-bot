FROM ubuntu:16.04
LABEL maintainer clarkzjw <clarkzjw@gmail.com>

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git wget build-essential python3 python3-dev python3-pip && \
  rm -rf /var/lib/apt/lists/*

RUN \
  pip3 install pymongo && \
  pip3 install python-telegram-bot

COPY . /usr/app
WORKDIR /usr/app

CMD python /usr/app/bot.py
