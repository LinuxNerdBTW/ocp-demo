FROM docker.io/library/nextcloud

# Set environment variable to expose port 8081
ENV NEXTCLOUD_PORT=8081

# Copy the Apache configuration file (replace if different)
COPY --from=0 /etc/apache2/ports.conf /etc/apache2/ports.conf.orig

# Modify the Apache configuration to listen on port 8081
RUN sed -i "s/Listen 80/Listen $NEXTCLOUD_PORT/g" /etc/apache2/ports.conf

# Expose port 8081
EXPOSE $NEXTCLOUD_PORT

# Run the default Nextcloud command
CMD ["apache2-foreground"]

