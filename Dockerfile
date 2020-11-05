FROM adoptopenjdk/openjdk11:latest
LABEL version="1.0.0" description="Disponibilizando api demo" maintainer="API Demo<alissoncruz.si@gmail.com>"
RUN cd / && mkdir Arquivos && chmod 777 -R Arquivos/
VOLUME /Arquivos/
EXPOSE 5005
EXPOSE 8080
EXPOSE 80

ARG PROFILE
ARG ADDITIONAL_OPTS

ENV PROFILE=${PROFILE}
ENV ADDITIONAL_OPTS=${ADDITIONAL_OPTS}

WORKDIR /opt/demo

COPY ./target/demo-0.0.1-SNAPSHOT.jar /usr/share/
#COPY /target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar

SHELL ["/bin/sh", "-c"]


CMD java ${ADDITIONAL_OPTS} -jar demo.0.0.1-SNAPSHOT.jar --spring.profiles.active=${PROFILE}
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
