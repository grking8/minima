FROM nginx:alpine
RUN addgroup -g 1000 -S www-data \
&& adduser -u 1000 -D -S -G www-data www-data

COPY ./_site /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html/.well-known/acme-challenge
COPY 32IpYFq8kW9F0mkJ_BtYQdEJAdKJP9nFlVMivyseFMI /usr/share/nginx/html/.well-known/acme-challenge
