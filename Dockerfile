FROM tomcat:8.0-alpine
ADD /target/mywebsiteProject-mywebsiteProject0.0.1-SNAPSHOT.war  /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
ENV DOCKERVERSION=18.03.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz
