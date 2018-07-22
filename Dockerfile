FROM nginx:alpine

COPY ./_site /usr/share/nginx/html
COPY ./custom.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
