FROM python:3.9-slim

#WORKDIR /code

RUN mkdir /app

COPY requirements.txt /app/

RUN pip install -r app/requirements.txt \
	&& rm -rf /root/.cache

COPY . /app/

WORKDIR /app

#ENV ENVIRONMENT_FILE=".env"

EXPOSE 8000

ENTRYPOINT ["gunicorn", "--config", "gunicorn_config.py", "index:server"]