FROM mcr.microsoft.com/vscode/devcontainers/python:0-3.10

# Install the PostgreSQL client and PostGIS extension
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*
