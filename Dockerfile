#
# Can be build by docker using the command:
#  docker build -t charliek/myweather .
#
# Can be run by docker using the command:
#  docker run -p 5050:5050 -it charliek/myweather
#

FROM charliek/openjdk-jre-7
MAINTAINER charlie.knudsen@gmail.com

EXPOSE 5050
ENV JAVA_OPTS -Xmx384m -Xss512k -XX:+UseCompressedOops
ENTRYPOINT ${JAVA_HOME}/bin/java $JAVA_OPTS -jar /app.jar

# The gradle file will add the jar to /app.jar
# Done to allow for the changing version number
# ADD build/libs/myweather-all.jar /app.jar
