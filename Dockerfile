FROM openjdk:8-jre-alpine

RUN useradd -ms /bin/sh new_user
USER new_user
WORKDIR /home/new_user 

EXPOSE 8080
  

COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]

