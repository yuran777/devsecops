FROM ghcr.io/aquasecurity/trivy:0.48.0

# Install required packages and cleanup
RUN apk --no-cache add bash curl npm

# Disable npm audit automatic fix
RUN npm config set audit-level high

# Copy the entrypoint script
COPY entrypoint.sh /

# Set execute permission for the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the image
ENTRYPOINT ["/entrypoint.sh"]
