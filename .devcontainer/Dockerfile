FROM mcr.microsoft.com/vscode/devcontainers/python:0-3.10

# Install PostgreSQL client, server and PostGIS
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client postgresql postgresql-contrib postgis \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Additional steps to setup and configure PostGIS if necessary
# Example: Initialize a database with PostGIS template
RUN service postgresql start && su - postgres -c "createdb mydb" \
    && su - postgres -c "psql -d mydb -c 'CREATE EXTENSION postgis;'"