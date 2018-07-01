FROM nginx:alpine

COPY ./_site /usr/share/nginx/html
COPY ./redirect.conf /etc/nginx/conf.d
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
