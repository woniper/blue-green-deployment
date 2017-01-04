docker stop app2;
docker rm app2;
docker rmi app2:0.1;
docker build --tag app2:0.1 .;
docker run --name app2 -p 8889:8889 -d app2:0.1;