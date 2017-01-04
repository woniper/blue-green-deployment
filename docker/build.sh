docker stop nginx;
docker stop app1;
docker stop app2;

docker rm nginx;
docker rm app1;
docker rm app2;

docker rmi nginx;
docker rmi app1;
docker rmi app2;

docker build --tag nginx:0.1 nginx/.;
docker build --tag app1:0.1 app1/.;
docker build --tag app2:0.1 app2.;

docker-compose up;
