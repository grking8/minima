FROM nginx

RUN mkdir -p /usr/share/nginx/html
COPY ./_site /usr/share/nginx/html
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
