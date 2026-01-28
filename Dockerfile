# ArkOps Website - Static Site
# Build: docker build -t arkops-website .
# Run:   docker run -d -p 80:80 arkops-website

FROM nginx:alpine

# Copy static files
COPY . /usr/share/nginx/html/

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Remove default nginx files and config from html dir
RUN rm -f /usr/share/nginx/html/50x.html \
    /usr/share/nginx/html/nginx.conf \
    /usr/share/nginx/html/Dockerfile \
    /usr/share/nginx/html/.dockerignore

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
