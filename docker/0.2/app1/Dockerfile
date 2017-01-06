FROM java:8
MAINTAINER woniper <leekw3747@gmail.com>

VOLUME /tmp
ADD app1.jar app1.jar
EXPOSE 8888
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app1.jar"]