FROM python:3.8-slim
USER root
WORKDIR /tmp
RUN chmod 1777 /tmp
RUN apt update -y
RUN apt install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
COPY ./requirements.txt /tmp
RUN cd /tmp && pip install -r requirements.txt
COPY . /tmp/
ENV DB_USERNAME="couser"
ENV DB_PASSWORD="copassword"
CMD python app.py
