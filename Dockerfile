FROM nginx:alpine

#COPY ./_site /usr/share/nginx/html
EXPOSE 80
CMD ["tail", "-f", "/dev/null"]
