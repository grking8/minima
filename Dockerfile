FROM nginx:alpine

COPY ./_site /usr/share/nginx/html
COPY ./redirect.conf /etc/nginx/conf.d
COPY ./404.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
