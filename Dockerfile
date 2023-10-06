FROM python:2.7
ENV DockerHOME=/home/app/webapp \
    DB_ENGINE='django.db.backends.postgresql_psycopg2' \
    DB_NAME='postgres' \
    DB_USER='postgres' \
    DB_PASSWORD='postgres' \
    DB_HOST='db' \
    DB_PORT='5432'
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN pip install psycopg2
EXPOSE 8080
CMD python2 notejam/manage.py syncdb --noinput && python2 notejam/manage.py migrate && python2 notejam/manage.py runserver 0.0.0.0:8000

# python3 manage.py runserver 0.0.0.0:8000