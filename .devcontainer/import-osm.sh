#!/bin/bash
set -e

# Database connection parameters
DB_NAME="app"
DB_USER="app_user"
DB_PASSWORD="app_password"
DB_HOST="localhost"

# URL to the OSM file and path to the style file
OSM_URL="https://download.geofabrik.de/europe/switzerland-latest.osm.pbf"
STYLE_FILE_PATH="/osm_files/default.style"
OSM_FILE_PATH="/osm_files/switzerland-latest.osm.pbf"

# Create osm-files directory if it doesn't exist
mkdir -p /osm_files

# Download the latest OSM file from Geofabrik
echo "Downloading the latest Switzerland OSM file..."
curl -L -o $OSM_FILE_PATH $OSM_URL

# Export database password to avoid prompt during osm2pgsql run
export PGPASSWORD=$DB_PASSWORD

# Run osm2pgsql to import the OSM data using the style file
echo "Importing OSM data into PostgreSQL..."
osm2pgsql --create --database=$DB_NAME --username=$DB_USER --host=$DB_HOST --port=5432 --style $STYLE_FILE_PATH --latlong --verbose $OSM_FILE_PATH

echo "OSM data import completed."
