FROM nginx:1.11
MAINTAINER woniper <leekw3747@gmail.com>

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY conf/app.conf  /etc/nginx/conf.d/app.conf
COPY conf/nginx.conf  /etc/nginx/nginx.conf

VOLUME ["/data", "/etc/nginx", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
