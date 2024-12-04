FROM ghcr.io/blooparksystems/bloopark-ci/py3.12-odooe18.0:latest

USER root

COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install debugpy --break-system-packages \
    && pip3 install -r /tmp/requirements.txt --break-system-packages

# this environment vars allows you to connect to postgres
# directly with psql command from this odoo container
ENV PGDATABASE=postgres
ENV PGPASSWORD=odoo
ENV PGUSER=odoo
ENV PGHOST=db

USER odoo
