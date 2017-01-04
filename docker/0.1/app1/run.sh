docker stop app1;
docker rm app1;
docker rmi app1:0.1;
docker build --tag app1:0.1 .;
docker run --name app1 -p 8888:8888 -d app1:0.1;