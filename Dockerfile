FROM nginx:alpine
RUN addgroup -g 1000 -S www-data \
&& adduser -u 1000 -D -S -G www-data www-data

COPY ./_site /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html/.well-known/acme-challenge
COPY VN3aaozqSXos6dkz0mcpFsoxNUuqbHdS36GMcH8sF7g /usr/share/nginx/html/.well-known/acme-challenge
