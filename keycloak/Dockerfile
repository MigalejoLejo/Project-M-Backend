# Use the official Keycloak image as the base image
FROM quay.io/keycloak/keycloak:latest

# Set the working directory inside the container
WORKDIR /opt/keycloak

# Copy both the script and the realm configuration file into the container
COPY ./ /opt/keycloak/setup/

# Run the necessary Keycloak startup commands
CMD ["-b", "0.0.0.0"]