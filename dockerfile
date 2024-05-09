# Base image
FROM ubuntu:latest

# Install MongoDB
RUN apt-get update && apt-get install -y mongodb

# Install Nginx
RUN apt-get install -y nginx

# Install Python and Flask
RUN apt-get install -y python3 python3-pip
RUN pip3 install flask

# Copy MongoDB config
COPY mongodb.conf /etc/mongodb.conf

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy frontend files
COPY index.html /var/www/html/

# Copy backend files
COPY server.py /opt/

# Expose ports
EXPOSE 27017 80

# Start services
CMD service mongodb start && service nginx start && python3 /opt/server.py
