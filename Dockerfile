FROM openjdk:8-jre-alpine

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
  
COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/\

RUN useradd -d /home/appuser -m -s /bin/bash appuser
USER appuser

WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]

