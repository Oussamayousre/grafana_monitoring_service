# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY metrics_app/requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

RUN pip3 install evidently==0.2.8
RUN pip3 install "pandas>=1.1.5,<2.0"


COPY metrics_app .

ENV FLASK_DEBUG=1


CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8080"]