#!/bin/bash

# CREATE USER AND DB FOR API
# ---------------------------

# Create the database
echo "Creating database $DB_NAME..."
psql --username=postgres --command="CREATE DATABASE $DB_NAME;"

# Create the user
echo "Creating user $DB_USER..."
psql --username=postgres --command="CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASSWORD';"

# Grant privileges to the user on the database
echo "Granting privileges to $DB_USER on $DB_NAME..."
psql --username=postgres --command="GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

# Grant privileges to the user on the public schema
echo "Granting privileges on public schema to $DB_USER..."
psql --username=postgres --dbname=$DB_NAME --command="GRANT USAGE, CREATE ON SCHEMA public TO $DB_USER;"

# Grant privileges on all tables, sequences, and functions in the public schema
echo "Granting privileges on all tables, sequences, and functions in the public schema to $DB_USER..."
psql --username=postgres --dbname=$DB_NAME --command="GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $DB_USER;"
psql --username=postgres --dbname=$DB_NAME --command="GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $DB_USER;"
psql --username=postgres --dbname=$DB_NAME --command="GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO $DB_USER;"

# Optionally, grant future privileges on any new tables, sequences, or functions
echo "Granting future privileges on tables, sequences, and functions in the public schema to $DB_USER..."
psql --username=postgres --dbname=$DB_NAME --command="ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO $DB_USER;"
psql --username=postgres --dbname=$DB_NAME --command="ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO $DB_USER;"
psql --username=postgres --dbname=$DB_NAME --command="ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO $DB_USER;"

echo "✅ - Database and user $DB_USER created successfully."

# CREATE USER AND DB FOR KEYCLOAK
# ---------------------------

# Create the database
echo "Creating database $KC_DB_NAME..."
psql --username=postgres --command="CREATE DATABASE $KC_DB_NAME;"

# Create the user
echo "Creating user $KC_DB_USER..."
psql --username=postgres --command="CREATE USER $KC_DB_USER WITH ENCRYPTED PASSWORD '$KC_DB_PASSWORD';"

# Grant privileges to the user on the database
echo "Granting privileges to $KC_DB_USER on $KC_DB_NAME..."
psql --username=postgres --command="GRANT ALL PRIVILEGES ON DATABASE $KC_DB_NAME TO $KC_DB_USER;"

# Grant privileges to the user on the public schema
echo "Granting privileges on public schema to $KC_DB_USER..."
psql --username=postgres --dbname=$KC_DB_NAME --command="GRANT USAGE, CREATE ON SCHEMA public TO $KC_DB_USER;"

# Grant privileges on all tables, sequences, and functions in the public schema
echo "Granting privileges on all tables, sequences, and functions in the public schema to $KC_DB_USER..."
psql --username=postgres --dbname=$KC_DB_NAME --command="GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $KC_DB_USER;"
psql --username=postgres --dbname=$KC_DB_NAME --command="GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $KC_DB_USER;"
psql --username=postgres --dbname=$KC_DB_NAME --command="GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO $KC_DB_USER;"

# Optionally, grant future privileges on any new tables, sequences, or functions
echo "Granting future privileges on tables, sequences, and functions in the public schema to $KC_DB_USER..."
psql --username=postgres --dbname=$KC_DB_NAME --command="ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO $KC_DB_USER;"
psql --username=postgres --dbname=$KC_DB_NAME --command="ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO $KC_DB_USER;"
psql --username=postgres --dbname=$KC_DB_NAME --command="ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO $KC_DB_USER;"

echo "✅ - Database and user $KC_DB_USER created successfully."
echo "✅ - Postgres ready - ✌️"