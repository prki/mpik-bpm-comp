FROM docker.io/eclipse-temurin:21-alpine

ENV APP_USER=1001
RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u $APP_USER
USER $APP_USER

COPY target/*-shaded.jar app.jar
EXPOSE 8080
CMD java -Xmx128m -Xms128m -XX:MaxMetaspaceSize=128m -Dlogback.configurationFile=logback-codenow.xml -Dconfig.file=/codenow/config/startup-message.txt -jar app.jar
