# Use an official PHP runtime as the base image
FROM php:8.0-cli

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the PHP files into the container
COPY . .

# Expose port 80 to the outside world
EXPOSE 80

# Set the default command to run when the container starts
CMD ["php", "-S", "0.0.0.0:80", "index.php"]
