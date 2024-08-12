FROM python:3.8-slim
USER root
WORKDIR /tmp
RUN apt update -y
RUN apt install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
COPY ./requirements.txt /tmp
RUN cd /tmp && pip install -r requirements.txt
COPY . /tmp/
CMD DB_USERNAME="couser" DB_PASSWORD="copassword" && python app.py
