### Blue-Green-Deployment Docker
--
<a href="http://martinfowler.com/bliki/BlueGreenDeployment.html">BlueGreen 배포</a>를 Docker를 이용한 예제입니다.

### 0.2
> dynamic proxy 적용이 안된 버전입니다. 때문에 무중단 배포는 아직 구현되지 않았지만, 버전 교체 자동화는 적용됐습니다.

#### Docker remote api 설정 ([참고](https://pyrasis.com/book/DockerForTheReallyImpatient/Chapter14))
<pre>
<code>
// linux
$sudo service docker stop // docker service 중지
$sudo docker -d -H tcp://0.0.0.0:4243 // docker tcp 설정

// docker for mac
$socat -d TCP-LISTEN:4243,range=127.0.0.1/32,reuseaddr,fork UNIX:/var/run/docker.sock
</code>
</pre>

#### docker-compose.blue.yml
<pre>
<code>
version: "2"
services:
  nginx:
    build: nginx/.
    image: nginx:0.2
    ports:
     - "80:80"
    depends_on:
     - app
  app:
    build: app1/.
    image: app1:0.2
</code>
</pre>

#### docker-compose.green.yml
<pre>
<code>
version: "2"
services:
  nginx:
    build: nginx/.
    image: nginx:0.2
    ports:
     - "80:80"
    depends_on:
     - app
  app:
    build: app2/.
    image: app2:0.2
</code>
</pre>

#### deploy.sh
<pre>
<code>
#!/usr/bin/env bash

DEPLOY_URL=tcp://127.0.0.1:4243;
DOCKER_APP_NAME=app;

EXIST_BLUE=$(DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml ps | grep Up);

#DOCKER_HOST=tcp://127.0.0.1:4243 docker-compose -p app-blue -f docker-compose.blue.yml up --build -d;

if [ -z "$EXIST_BLUE" ]; then
    echo ">>>>>>>>>>>> EXIST BLUE...";
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml down;
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml up -d;
else
    echo ">>>>>>>>>>>> EXIST GREEN...";
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml down;
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml up -d;
fi
</code>
</pre>

### 0.1
--
> nginx upstream을 이용해 app1, app2를 proxy 설정.

#### docker-compose.yml
<pre>
<code>
version: "2"
services:
  nginx:
    build: nginx/.
    image: nginx:0.1
    ports:
     - "80:80"
    links:
     - app1
     - app2
  app1:
    build: app1/.
    image: app1:0.1
    ports:
     - "8888:8888"
  app2:
    build: app2/.
    image: app2:0.1
    ports:
      - "8889:8889"
</code>
</pre>

> 실행 : docker-compose up