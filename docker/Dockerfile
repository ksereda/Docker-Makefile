FROM openjdk:8-jre-alpine

WORKDIR root/

ADD build/libs/backend-*.jar ./application.jar

EXPOSE 8080

RUN apk add --no-cache xvfb wkhtmltopdf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

CMD java -server \
    -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled \
    -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70 \
    -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark \
    -jar /root/application.jar