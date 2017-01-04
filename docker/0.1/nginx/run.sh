docker stop nginx;
docker rm nginx;
docker rmi nginx:0.1;
docker build --tag nginx:0.1 .;
docker run --name nginx -p 80:80 --link app1:app1 --link app2:app2 -d nginx:0.1;