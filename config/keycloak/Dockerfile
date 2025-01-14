# Use the official Keycloak image as the base image
FROM quay.io/keycloak/keycloak:latest

# Set the working directory inside the container
WORKDIR /opt/keycloak

# Copy both the script and the realm configuration file into the container
COPY myrealm-config.json /opt/keycloak/data/import/
# Run the necessary Keycloak startup commands

