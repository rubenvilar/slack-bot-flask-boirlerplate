FROM python:3.8-buster

ENV DEBIAN_FRONTEND noninteractive

ARG APP_ENV

RUN apt-get update -y && apt-get dist-upgrade -y && apt-get install -y \
    nginx supervisor \
    python-dev uwsgi-plugin-python

COPY . /var/www/app
WORKDIR /var/www/app

RUN pip install pipenv
RUN pipenv install $(test "$APP_ENV" = production || echo "--dev") --deploy --system --ignore-pipfile

COPY nginx/flask.conf /etc/nginx/sites-available/
COPY supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /var/log/nginx/app /var/log/uwsgi/app /var/log/supervisor \
    && rm /etc/nginx/sites-enabled/default \
    && ln -s /etc/nginx/sites-available/flask.conf /etc/nginx/sites-enabled/flask.conf \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    &&  pipenv install \
    && chown -R www-data:www-data /var/www/app \
    && chown -R www-data:www-data /var/log


CMD ["/usr/bin/supervisord"]