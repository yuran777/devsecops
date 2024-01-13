# Use the official Nginx base image
FROM nginx:latest

# Install curl to make API requests
RUN apt-get update && apt-get install -y curl

# Create a directory to store custom HTML files
WORKDIR /usr/share/nginx/html

# Copy the custom index.html file
COPY index.html .

# Make API request to OpenWeatherMap and embed the result in index.html
RUN WEATHER=$(curl -s "http://wttr.in/Seoul?format=%t%20%C") && sed -i "s|{{WEATHER}}|$WEATHER|g" index.html

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
